#!/bin/bash
. ${WORKSPACE}/jenkins/scripts/env.sh
IMAGE_TAG="v${BUILD_NUMBER}"
echo $IMAGE_TAG
echo $DOCKER_REPO

SERVICEACCT_FILE=${WORKSPACE}/Kubernetes/serviceaccount.yaml
DEPLOYMENT_FILE=${WORKSPACE}/Kubernetes/deployment.yaml
SERVICE_FILE=${WORKSPACE}/Kubernetes/service.yaml
INGRESS_FILE=${WORKSPACE}/Kubernetes/ingress.yaml
KUBE_CONFIG_FILE=${WORKSPACE}/Kubernetes/kubeconfig

sed -i "s/DOCKER_REPO/${DOCKER_REPO}/g" ${DEPLOYMENT_FILE}
sed -i "s/SERVICE_NAME/${SERVICE_NAME}/g" ${DEPLOYMENT_FILE}
sed -i "s/IMAGE_TAG/v${BUILD_NUMBER}/g" ${DEPLOYMENT_FILE}
sed -i "s/SERVICE_PORT/${SERVICE_PORT}/g" ${DEPLOYMENT_FILE}
sed -i "s/NAMESPACE/${NAMESPACE}/g" ${DEPLOYMENT_FILE}

sed -i "s/SERVICE_NAME/${SERVICE_NAME}/g" ${SERVICE_FILE}
sed -i "s/SERVICE_PORT/${SERVICE_PORT}/g" ${SERVICE_FILE}
sed -i "s/NAMESPACE/${NAMESPACE}/g" ${SERVICE_FILE}

sed -i "s/SERVICE_NAME/${SERVICE_NAME}/g" ${INGRESS_FILE}
sed -i "s/SERVICE_PORT/${SERVICE_PORT}/g" ${INGRESS_FILE}
sed -i "s/INGRESS_HOST/${INGRESS_HOST}/g" ${INGRESS_FILE}
sed -i "s|PATH_NAME|${PATH_NAME}|g" ${INGRESS_FILE}
sed -i "s/NAMESPACE/${NAMESPACE}/g" ${INGRESS_FILE}



cat ${DEPLOYMENT_FILE}
echo '\n'
cat ${SERVICE_FILE}
echo '\n'
cat ${INGRESS_FILE}
echo '\n'


kubectl --kubeconfig ${KUBE_CONFIG_FILE} apply -f ${DEPLOYMENT_FILE}
kubectl --kubeconfig ${KUBE_CONFIG_FILE} apply -f ${SERVICE_FILE}
kubectl --kubeconfig ${KUBE_CONFIG_FILE} apply -f ${INGRESS_FILE}







