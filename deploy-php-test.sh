#!/bin/bash

# Deploys PHY MySQL admin console for dev

export CURRENT_DIR=`pwd`

echo "*****************************"
echo "Start test PHP deploy"
date
echo "*****************************"

echo "Deploying MySQL consoles for each database"
cd "$CURRENT_DIR/phpmyadmin"
cf push -f manifest-consumer-test.yml
cf push -f manifest-pay-hist-test.yml
cf push -f manifest-pay-test.yml

cd "$CURRENT_DIR"
echo "************************"
echo "End test PHP deploy"
date
echo "************************"
