#!/bin/bash

sudo docker pull softeerteam1/mycardeepdive_dev:latest

sudo docker run -d -p 8081:8081 --name my-car-deep-dive softeerteam1/mycardeepdive_dev:latest

sudo docker rmi -f $(docker images -f "dangling=true" -q) || true