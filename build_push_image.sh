#!/bin/bash

# Variabel agar script lebih rapi
USER_DOCKERHUB="rezachrisna34"
IMAGE_NAME="item-app"
TAG="v1"

# 1. Build Docker image dengan nama item-app dan tag v1
echo "--- Memulai Build Image ---"
docker build -t $IMAGE_NAME:$TAG .

# 2. Melihat daftar image di lokal
echo "--- Daftar Image Lokal ---"
docker images

# 3. Tagging image agar sesuai format Docker Hub
echo "--- Tagging Image ---"
docker tag $IMAGE_NAME:$TAG $USER_DOCKERHUB/$IMAGE_NAME:$TAG

# 4. Login ke Docker Hub (Menggunakan variabel environment agar aman)
echo "--- Login ke Docker Hub ---"
echo $PASSWORD_DOCKER_HUB | docker login -u $USER_DOCKERHUB --password-stdin

# 5. Push image ke Docker Hub
echo "--- Mengunggah Image ke Docker Hub ---"
docker push $USER_DOCKERHUB/$IMAGE_NAME:$TAG

echo "--- Selesai! Image berhasil di-push ---"
