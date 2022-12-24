#!/bin/bash

# container registry
CR_USERNAME=kamalmahmudi
CR_PAT=MY_PERSONAL_ACCESS_TOKEN
CR_IMAGE=item-app
CR_TAG=v1

# build image
docker build -t $CR_IMAGE:$CR_TAG .
# list local images
docker images
# retag image to to github packages container registry
docker tag $CR_IMAGE:$CR_TAG ghcr.io/$CR_USERNAME/$CR_IMAGE:$CR_TAG

# login to github packages
echo $CR_PAT | docker login ghcr.io -u $CR_USERNAME --password-stdin
# push image
docker push ghcr.io/$CR_USERNAME/$CR_IMAGE:$CR_TAG
