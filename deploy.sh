#!/bin/bash

docker tag "datalab-language-api:latest" $DOCKERHUB_USER/datalab-language-api

echo 'Docker Login - BEGIN'
docker login -u $DOCKERHUB_USER -p $DOCKERHUB_PWD
echo 'Docker Login - END'

echo 'Docker Push - BEGIN'
docker push "idelab/datalab-language-api:latest"
echo 'Docker Push - END'
