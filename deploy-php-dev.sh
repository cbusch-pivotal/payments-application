#!/bin/bash

# Deploys PHY MySQL admin console for dev

export CURRENT_DIR=`pwd`

echo "*****************************"
echo "Start development PHP deploy"
date
echo "*****************************"

echo "Deploying MySQL consoles for each database"
cd "$CURRENT_DIR/phpmyadmin"
cf push -f manifest-consumer-dev.yml
cf push -f manifest-pay-hist-dev.yml
cf push -f manifest-pay-dev.yml

cd "$CURRENT_DIR"
echo "************************"
echo "End development deploy"
date
echo "************************"
