#!/bin/bash
set -x

if [ ! -d emoji-inclusion ]; then
  git clone https://github.com/timosalm/emoji-inclusion.git
fi
export INCLUSION_CONTAINER_IMAGE=$1
(cd emoji-inclusion && ./mvnw spring-boot:build-image -Dspring-boot.build-image.imageName=$INCLUSION_CONTAINER_IMAGE)
docker push $INCLUSION_CONTAINER_IMAGE