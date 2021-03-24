#!/bin/bash

cd /var/run/dummy-api
fuser -k 8080/tcp
java -jar dummy-api.jar &