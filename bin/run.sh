#!/bin/bash
cd "$(dirname "$0")"
mvn clean package
exec java -jar jetty-runner.jar helloworld.war