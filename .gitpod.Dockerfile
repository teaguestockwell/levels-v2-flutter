FROM cirrusci/flutter:2.0.1

# package to generate html code coverage report from lcov.info
RUN apt-get update -qq -y && apt-get install lcov -y