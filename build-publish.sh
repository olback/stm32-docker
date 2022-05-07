#!/bin/bash

TAG=$(ls en.st-stm32cubeide*.deb_bundle.sh.zip | grep -Po '^en\.st-stm32cubeide_\K[0-9]{1,2}\.[0-9]{1,2}\.[0.9]{1,2}(?=.*_amd64\.deb_bundle\.sh\.zip$)')

echo "Building image with tag: $TAG"

docker image build -t olback/stm32cubeide:$TAG .
docker tag olback/stm32cubeide:$TAG olback/stm32cubeide:latest

docker push olback/stm32cubeide:$TAG
docker push olback/stm32cubeide:latest
