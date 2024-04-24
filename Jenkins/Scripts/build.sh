#!/bin/bash
. ${WORKSPACE}/Jenkins/scripts/env.sh
DOCKERFILE=${WORKSPACE}/Dockerfile

cat ${DOCKERFILE}
docker build -t ${DOCKER_REPO}/${SERVICE_NAME} -f ${DOCKERFILE} .
  if [ $? -ne 0 ]
  then
    echo "docker build failed"
    exit 1
  fi

trivy image ${DOCKER_REPO}/${SERVICE_NAME} --format json  -o image-scan-report.json

docker tag ${DOCKER_REPO}/${SERVICE_NAME} ${DOCKER_REPO}/${SERVICE_NAME}:v${BUILD_NUMBER}
docker push ${DOCKER_REPO}/${SERVICE_NAME}:v${BUILD_NUMBER}

docker rmi ${DOCKER_REPO}/${SERVICE_NAME}
docker rmi ${DOCKER_REPO}/${SERVICE_NAME}:v${BUILD_NUMBER}