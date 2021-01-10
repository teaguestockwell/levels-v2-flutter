# Install dependencies
FROM debian:latest AS build-env
RUN apt-get update 
RUN apt-get install -y bash curl file git unzip xz-utils zip

# Clone the flutter repo from a specific release
RUN git clone https://github.com/flutter/flutter.git

# cd into flutter 
WORKDIR /flutter

# Roll flutter to the same commit hash as local dev
RUN git checkout 19b76ade6f6fa0cd739b43eac7c369375c2bc4a5

# Set flutter path 
ENV PATH "$PATH:/flutter/bin"

# Enable flutter web
RUN flutter config --enable-web

# Make folder for project
WORKDIR /app

# Copy context of docker build into /app
COPY . /app

# Clean
RUN flutter clean

# Get app packages
RUN flutter pub get

# Echo version
RUN flutter doctor

# Build app for web using skia => webassembly using webgl
RUN flutter build web --web-renderer canvaskit --release

# Final docker stage.
FROM nginx
#FROM registry.il2.dso.mil/platform-one/devops/pipeline-templates/base-image/harden-nginx-19:1.19.0.244

# Run as a unprivileged user
#USER appuser

# Copy build output from first stage 
COPY --from=0 /app/build/web /usr/share/nginx/html
#COPY ./build/web/ /usr/share/nginx/html

# Copy nginx config from first stage --from=0 /fl/nginx.config
COPY nginx.config /etc/nginx/nginx.conf

# Document the exposed port
EXPOSE  80

# Serve that build
CMD [ "nginx", "-g", "daemon off;" ]