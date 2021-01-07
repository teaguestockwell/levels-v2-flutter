# Multi-stage docker build. First load CentOS and install wget
FROM debian as wgetsrc
# # Multistage docker build. First load debian and install dependancies for flutter
# FROM debian:latest AS build-env
RUN apt-get update 
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3 psmisc
RUN apt-get clean

# Install flutter dep https://flutter.dev/docs/get-started/install/linux
#RUN yum update all
#RUN yum install -y bash curl file git mkdir rm unzip which xz-utils zip
#RUN yum clean all

# Make folder for flutter
WORKDIR /flut

# Clone the flutter repo
RUN git clone https://github.com/flutter/flutter.git -b beta --depth 1

# Set flutter path 
ENV PATH "$PATH:/flut/flutter/bin"

# Make folder for project
WORKDIR /five_level_one

# Copy app flies into container
COPY . /five_level_one

# Switch to beta channel of flutter
RUN flutter channel beta

RUN for d in $(ls */); do echo $d; done

# Enable web builds
RUN flutter config --enable-web

# Get additinal flutter dependancies
RUN flutter upgrade

# Show flutter config
RUN flutter doctor

# Get App Dependencies
RUN flutter pub get

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
COPY --from=0 /five_level_one/build/web /usr/share/nginx/html

# Copy nginx config from first stage --from=0 /fl/nginx.config
COPY nginx.config /etc/nginx/nginx.conf

# Document the exposed port
EXPOSE  80

# Serve that build
CMD [ "nginx", "-g", "daemon off;" ]