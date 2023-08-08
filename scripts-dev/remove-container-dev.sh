#!/bin/bash

sudo docker ps -a -q --filter "name=my-car-deep-dive" | grep -q . && docker stop my-car-deep-dive && docker rm my-car-deep-dive | true

sudo docker rmi softeerteam1/mycardeepdive_dev || true