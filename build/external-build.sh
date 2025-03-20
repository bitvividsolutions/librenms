#! /bin/bash

export ECR_LOC=xconnected
export ECR_REPO=components
export LOCAL_BUILD_NAME=nms
export LOCAL_BUILD_VER=1.0
dckr_pat = $1

export PROD_BUILD_NAME=nms
export PROD_BUILD_VER=1.0


docker build  . -f Dockerfile -t $LOCAL_BUILD_NAME:$LOCAL_BUILD_VER --network=host
docker tag $LOCAL_BUILD_NAME:$LOCAL_BUILD_VER   $ECR_LOC/$ECR_REPO:$PROD_BUILD_NAME-$PROD_BUILD_VER
echo "$dckr_pat" | docker login -u xconnected --password-stdin
docker push $ECR_LOC/$ECR_REPO:$PROD_BUILD_NAME-$PROD_BUILD_VER
echo $ECR_LOC/$ECR_REPO:$PROD_BUILD_NAME-$PROD_BUILD_VER