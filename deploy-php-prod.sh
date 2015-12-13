#!/bin/bash

# Deploys PHY MySQL admin console for dev

export CURRENT_DIR=`pwd`

echo "*****************************"
echo "Start production PHP deploy"
date
echo "*****************************"

echo "Deploying MySQL consoles for each database"
cd "$CURRENT_DIR/phpmyadmin"
cf push -f manifest-consumer.yml
cf push -f manifest-pay-hist.yml
cf push -f manifest-pay.yml

cd "$CURRENT_DIR"
echo "************************"
echo "End production deploy"
date
echo "************************"
