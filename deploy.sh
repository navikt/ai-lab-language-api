#!/bin/bash
echo "$DOCKERHUB_PWD" | docker login -u "$DOCKERHUB_USER" --password-stdin
docker push "navikt/nav-aapen-kildekode:$TRAVIS_COMMIT"