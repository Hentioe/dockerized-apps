#!/usr/bin/env bash

docker compose exec server java -jar /home/rundeck/rundeck.war --encryptpwd Jetty
