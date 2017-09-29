#!/bin/bash

#停止容器
echo "1. stopping the \"Exited\" containers..."
sudo docker stop $(docker ps -a | grep "Exited" | awk '{print $1 }')
echo "the containers stopped\n"

#删除容器
echo "2. removing the \"Exited\" containers..."
sudo docker rm $(docker ps -a | grep "Exited" | awk '{print $1 }')
echo "the containers removed\n"

#删除镜像
echo "3. removing the images with \"none\" tag..."
sudo docker rmi $(docker images | grep "none" | awk '{print $3}')
echo "the images with \"none\" tag removed\n"

#显示容器
echo "4. the current containers:"
sudo docker ps -a
echo "\n"

#显示镜像
echo "5. the current images:"
sudo docker images
echo "\n"
