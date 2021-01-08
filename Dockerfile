# Install dependencies
FROM debian:latest AS build-env
RUN apt-get update 
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3 psmisc
RUN apt-get clean

# Clone the flutter repo from the lastest beta channel
RUN git clone https://github.com/flutter/flutter.git -b beta --depth 1

# Set flutter path 
ENV PATH "$PATH:/flutter/bin"

# Enable flutter web
RUN flutter channel beta
RUN flutter upgrade
RUN flutter config --enable-web

# Show flutter config/get dependancies
RUN flutter doctor

# Make folder for project
WORKDIR /app

COPY . /app

RUN flutter pub get

RUN flutter doctor

# Build app for web using skia => webassembly using webgl
RUN flutter build web --web-renderer canvaskit --release

# Multi-stage docker build. Finally load the hardened image needed to serve webpage
#FROM registry.il2.dso.mil/platform-one/devops/pipeline-templates/base-image/harden-nginx-19:1.19.0.244
FROM nginx

# Run as a unprivileged user
#USER appuser

WORKDIR /build

# Copy build output from first stage 
#COPY ./build/web/ /usr/share/nginx/html
COPY --from=0 /app/five_level_one/build/web /usr/share/nginx/html

# Copy nginx config from first stage --from=0 /fl/nginx.config
COPY nginx.config /etc/nginx/nginx.conf

# Document the exposed port
EXPOSE  80

# Serve that build
CMD [ "nginx", "-g", "daemon off;" ]