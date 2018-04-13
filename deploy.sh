#!/bin/bash
docker login -u $DOCKERHUB_USER -p $DOCKERHUB_PWD
docker push "idelab/datalab-language-api:$TRAVIS_TAG"