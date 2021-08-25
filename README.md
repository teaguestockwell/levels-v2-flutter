[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

[license-shield]: https://img.shields.io/github/license/tsAppDevelopment/hello2.svg
[license-url]: https://github.com/tsAppDevelopment/hello2/blob/master/licence.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/teague-stockwell/

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="http://fivelevel.web.app/">
    <img src="https://user-images.githubusercontent.com/71202372/130726291-bf102538-21c2-4f9e-becd-d445df03de6b.png" alt="Logo" width="100%" >
  </a>

  <h1 align="center">Five Level</h3>

  <p align="center">
    Second iteration of aircraft cargo loading and weight and balance
    <br />
    <a href="http://fivelevel.web.app/">View live</a>
    ·
    <a href="https://forms.gle/Bbqvubn6gwC6fRnc8">Report Bug</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#overview">About</a></li>
    <ul>
      <li><a href="#overview">Overview</a></li>
       <li><a href="#about-the-ui">UI</a></li>
       <li><a href="#about-the-api">API</a></li>
    </ul>
    <li><a href="#ui-built-with">Built With</a></li>
    <ul>
       <li><a href="#ui-built-with">UI</a></li>
       <li><a href="#api-built-with">API</a></li>
    </ul>
    <li><a href="#prerequisites">Getting Started</a></li>
    <ul>
      <li><a href="#prerequisites">Prerequisites</a></li>
       <li><a href="#compose-prod">Compose Prod</a></li>
       <li><a href="#developing-locally">Developing Locally</a></li>
       <li><a href="#ui-testing">UI Testing</a></li>
       <li><a href="#api-testing">API Testing</a></li>
    </ul>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

# About
## Overview
Five level is a the second iteration of an app that manages aircraft cargo loading and weight and balance for the US Air Force.

The first and second iterations were built with tech stacks that could not be accredited and deployed to the Air Force network:

1. [5 Level](https://github.com/tsAppDevelopment/levels-v1-android) Native Android
2. [Five Level](https://github.com/tsAppDevelopment/levels-v2-flutter) Flutter
3. Levels - [UI Repo](https://github.com/tsAppDevelopment/levels-v3-react) and [API Repo](https://github.com/tsAppDevelopment/levels-v2v3-express) React

Five Level, this iteration is depreciated and has been replaced by Levels. Five Level is deployed [here](http://fivelevel.web.app/) to use a serverless document DB (Firebase Firestore), but the master branch may also be ran as a container using [this API](https://github.com/tsAppDevelopment/levels-v2v3-express)
## About the UI
The frontend service has four main components. The dashboard, admin portal, unit conversion, and the glossary.

### Dashboard
The dashboard is used for configuring a cargo load to perform aircraft weight and balance.

<p align="center">
  <img src="https://user-images.githubusercontent.com/71202372/112102213-27c34b00-8b65-11eb-9ef5-9cfc10713a83.gif" />
</p>

### Admin Portal
The admin portal is used for performing CRUD operations on users, aircraft, configurations, and cargo. Below, the left side is Prisma Studio, and the right is the Flutter implementation of the admin portal.

<p align="center">
  <img src="https://user-images.githubusercontent.com/71202372/112105405-986c6680-8b69-11eb-9c34-b60b4aff17e6.gif" />
</p>

### Unit Conversion
The unit conversion tab has a custom flutter implementation of a unit conversion component inspired by Googe's web implementation [here](https://www.google.com/search?q=google+unit+conversion) and utilitys to work with time and date that are common for aircraft mechanics when filling out forms.

<p align="center">
  <img src="https://user-images.githubusercontent.com/71202372/112102189-2134d380-8b65-11eb-8d8f-20514a459e2e.gif" />
</p>

### Glossary
<p align="center">
  <img src="https://user-images.githubusercontent.com/71202372/112102218-298d0e80-8b65-11eb-912e-9113883b4e76.gif" />
</p>


### UI Features
- Offline persistance
- Lazy loading
- Unit conversion component
- Admin portal to update deeply nested user models
## About the API
There are two APIs that can support this project. The first is a document DB (Firebase Firestore) and the second is a Node server in front of Postgresql.

The deployed version uses Firestore and it supports read only. The Node server supports CRUD operations on multiple aircraft and user roles using JWTs.

### API Features
- JWT based user roles for each aircraft
- Local memory cache of common routes
- Logging
# Built With
## UI Built With
- [Flutter](https://github.com/flutter/flutter)
## API Built With
- [*Postgres](https://github.com/postgres/postgres)
- [*Express](https://expressjs.com/)
- [*Prisma](https://www.prisma.io/)
- [*TypeScript](https://www.typescriptlang.org/)
- [*Firebase Firestore](https://firebase.google.com/docs/firestore/)

# Getting Started
## Prerequisites

1. [NodeJS](https://nodejs.org/en/download/)
2. [Docker](https://www.docker.com/get-started)
3. [Git](https://git-scm.com/downloads)
4. [VS Code Remote Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
5. Clone the [UI](https://github.com/tsAppDevelopment/levels-v2-flutter) and [API](https://github.com/tsAppDevelopment/levels-v2v3-express) from GitHub into the same directory
## Compose Prod
To compose a production version locally, follow these steps.
1. Open the frontend repo in VS Code
2. Build the UI, API, DB, and Proxy images
```sh
docker-compose -f e2e-compose-os.yml -p fl-e2e-os build --no-cache --parallel
```
3. Compose the services
```sh
docker-compose -f e2e-compose-os.yml -p fl-e2e-os up --force-recreate
```

## Developing Locally
For convenience the Flutter SDK and VS Code extensions that are needed to build the UI are included in a dev container. To use the dev container, follow these steps.

1. Reopen the frontend repo in a docker container: In the bottom left corner, click the green >< and select "Reopen in container"

2. Run dev server of Flutter inside the container
```
flutter run -d chrome --web-port 8080
```

3. Open container:8080 locally when the port is mapped to localhost.

### UI Testing
4. In the root of the repo, and inside the dev container, run the following command to start the UI tests
```sh
test/cc_report.sh
```
### API Testing
Tests are run as integrations tests inside of a Postgresql service and a node service. Between each test the database may need to be reset and reseeded. See `aircraft.test` for an example.

The test utils contains mocks of different user roles that can be passed to the auth header in [Supertest](https://www.npmjs.com/package/supertest).

Use :os at the end of these commands if you have not logged on to the hardened registry.
1. Build the API and run a container with the test script against an instance of Postgresql 
```sh
npm run docker:test
```

# Roadmap
This service has been depreciated and will be replaced by the [Levels UI](https://github.com/tsAppDevelopment/levels-v3-react) written in React.

Report a [bug](https://forms.gle/Bbqvubn6gwC6fRnc8)

# License
Distributed under the MIT License. See `licence` for more information.
# Contact
Teague Stockwell - [LinkedIn](https://www.linkedin.com/in/teague-stockwell)
# Acknowledgements
- [Brandon Swenson](https://github.com/bmswens) for helping containerize with hardened images
<!-- ![output](https://user-images.githubusercontent.com/71202372/112101303-a4edc080-8b63-11eb-9712-97a42599a66d.gif) -->
<!-- ![output](https://user-images.githubusercontent.com/71202372/112105405-986c6680-8b69-11eb-9c34-b60b4aff17e6.gif) -->
<!-- ![1](https://user-images.githubusercontent.com/71202372/112102189-2134d380-8b65-11eb-8d8f-20514a459e2e.gif) -->
<!-- ![2](https://user-images.githubusercontent.com/71202372/112102213-27c34b00-8b65-11eb-9ef5-9cfc10713a83.gif) -->
<!-- ![3](https://user-images.githubusercontent.com/71202372/112102218-298d0e80-8b65-11eb-912e-9113883b4e76.gif) -->
