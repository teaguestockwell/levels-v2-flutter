#!/bin/bash
echo "running test to generate coverage/lcov.info"
flutter test --coverage

echo "generating html code cov report in coverage/html"
genhtml coverage/lcov.info -o coverage/html

echo "serving code cov report on container port: 80, please open localy on forwarded port"
cd coverage/html && python3 -m http.server 80