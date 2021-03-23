# Required dependencies
1. install git https://www.atlassian.com/git/tutorials/install-git
2. install docker: https://docs.docker.com/get-docker/
3. install vscode: https://code.visualstudio.com/download
4. install the vs code extension: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers
# To compose UI-API-DB
#### Mac
git clone https://code.il2.dso.mil/tron/products/five-level-app/frontend.git frontend && git clone https://code.il2.dso.mil/tron/products/five-level-app/api.git api && git clone https://code.il2.dso.mil/tron/products/five-level-app/docker-compose-dev.git fullstack-template && cd fullstack-template && bin/run.sh
#### Windows
git clone https://code.il2.dso.mil/tron/products/five-level-app/frontend.git frontend && git clone https://code.il2.dso.mil/tron/products/five-level-app/api.git api && git clone https://code.il2.dso.mil/tron/products/five-level-app/docker-compose-dev.git fullstack-template && cd fullstack-template && bin/run.ps1
# Setup your dev env
1. click on green button that looks like this in bottom left of vs code >< 
2. click open workspace in container
3. code stuff && profit?
# Testing
#### run tests
inside container run: flutter test 
#### run tests generate html code cov
inside container run: test/cc_report.sh
# What the heck is a fullstack template?
BSwenson made a tool that mock the P1 env locally by injecting an auth header. This allows us to create roles and profiles for users authenticated with P1's Keycloak: https://code.il2.dso.mil/brandon.swenson/fullstack-template

# A X-Platform application for aircraft weight an balance using Google Flutter.
AMC MX Group Conference presentation https://www.youtube.com/watch?v=ybnVkH23D60&feature=youtu.be

To run an old web build that is hosted on the interwebs: https://fivelevel.web.app

Flutter build command used for release
flutter build web --web-renderer canvaskit --release

Docker command used to rm, build, and run img
docker rm flfimg && docker build . -t flf && docker run -p 8080:8080 --name flfimg flf && docker exec -it flfimg bash

![output](https://user-images.githubusercontent.com/71202372/112101303-a4edc080-8b63-11eb-9712-97a42599a66d.gif)
![1](https://user-images.githubusercontent.com/71202372/112102189-2134d380-8b65-11eb-8d8f-20514a459e2e.gif)
![2](https://user-images.githubusercontent.com/71202372/112102213-27c34b00-8b65-11eb-9ef5-9cfc10713a83.gif)
![3](https://user-images.githubusercontent.com/71202372/112102218-298d0e80-8b65-11eb-912e-9113883b4e76.gif)