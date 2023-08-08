#!/bin/bash

# 가동중인 도커 중단 및 삭제
sudo docker ps -a -q --filter "name=my-car-deep-dive" | grep -q . && docker stop my-car-deep-dive && docker rm my-car-deep-dive | true

# 기존 이미지 삭제
sudo docker rmi softeerteam1/mycardeepdive_prod || true