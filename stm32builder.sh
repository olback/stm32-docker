#!/bin/bash

set -e

PROJ_NAME=$1
PROJ_CONFIG=${2:-Release}

if [ -z $PROJ_NAME ]; then
    PROJ_NAME=$(grep -Po '<name>\K[A-Za-z0-9-_]{1,50}(?=</name>)' .project)
fi

echo "Project name: $PROJ_NAME"
echo "Project configuration: $PROJ_CONFIG"

/opt/st/$(ls /opt/st)/headless-build.sh -data $HOME/.stm32workspace -cleanBuild "$PROJ_NAME/$PROJ_CONFIG" -importAll .

cd $OLDPWD
