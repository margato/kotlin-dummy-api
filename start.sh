#!/bin/bash

cd ~/kotlin-dummy-api/build
fuser -k 8080/tcp
java -jar dummy-api.jar &