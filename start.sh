#!/bin/bash

cd /var/run/dummy-api/dummy-api.jar
fuser -k 8080/tcp
java -jar dummy-api.jar &