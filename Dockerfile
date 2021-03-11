# Install dependencies
FROM cirrusci/flutter:2.0.1

# Install web sdk
RUN flutter precache --web 

# Make folder for project
WORKDIR /app

# Copy context of docker build into /app
COPY . .

# Get app packages
RUN flutter pub get

# Echo version 
RUN flutter doctor

# SCA && Lint
RUN flutter analyze; exit 0

# Run tests, continue on error
RUN flutter test --machine > tests.output; exit 0

# Compute coverage (--machine and --coverage cannot be run at once...), continue on error
RUN flutter test --coverage; exit 0

# Run SonarQube using this plugin https://github.com/insideapp-oss/sonar-flutter
#RUN sonar-scanner

# Build app for web using skia => webassembly using webgl
RUN flutter build web --web-renderer canvaskit --release

# Final docker stage.
FROM registry1.dso.mil/ironbank/opensource/nginx/nginx:1.19.6

# Run as a unprivileged user
USER appuser

# Copy build output from first stage into dir that nginx serves
COPY --from=0 /app/build/web /usr/share/nginx/html

# Copy nginx config from root dir into nginx config
COPY nginx.config /etc/nginx/nginx.conf

# Document the exposed port
EXPOSE  8080

# Serve that build
CMD [ "nginx", "-g", "daemon off;" ]