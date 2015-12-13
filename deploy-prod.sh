#!/bin/bash

# Deploys all of the microservices for the MasterCard demo
# Make sure you're targeted and logged in to the right CF endpoint
# prior to running this script.

# Change the SKIP_TESTS variable to whether or not you want to run tests as
# part of the build.

export CURRENT_DIR=`pwd`
export SKIP_TESTS=true

echo "***********************"
echo "Start production deploy"
date
echo "***********************"

if [ "-p" == "$1" ]; then
  echo "Adding phpmyadmin consoles..."
fi

echo "Creating services as needed"
./create-services.sh

echo "Building and deploying eureka-server"
cd "$CURRENT_DIR/eureka-server"
mvn clean package -Dmaven.test.skip=$SKIP_TESTS
cf push

echo "Building and deploying push-notification"
cd "$CURRENT_DIR/push-notification"
mvn clean package -Dmaven.test.skip=$SKIP_TESTS
cf push

echo "Building and deploying payment-service"
cd "$CURRENT_DIR/payment-service"
mvn clean package -Dmaven.test.skip=$SKIP_TESTS
cf push

echo "Building and deploying payment-history-service"
cd "$CURRENT_DIR/payment-history-service"
mvn clean package -Dmaven.test.skip=$SKIP_TESTS
cf push

echo "Building and deploying payments"
cd "$CURRENT_DIR/api-gateway"
mvn clean package -Dmaven.test.skip=$SKIP_TESTS
cf push

if [ "-p" == "$1" ]; then
  source ./deploy-php-prod.sh
fi

cd "$CURRENT_DIR"

echo "***********************"
echo "End production deploy"
date
echo "***********************"
