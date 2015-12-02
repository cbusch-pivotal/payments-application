#!/bin/bash

# Creates the necessary CF services
# Make sure you're targeted and logged in to the right CF endpoint
# prior to running this script.

# You only need to run this once in each CF environment / space.

# Create the RabbitMQ service for payment-service and payment-history-service
cf delete-service -f payment-mq

# Create the MySQL service for payment history service
cf delete-service -f payment-history-service-db

# Create the MySQL service for consumer messaging service
cf delete-service -f consumer-messaging-db

# Create the MySQL service for payment service
cf delete-service -f payment-service-db

# Create the auto-scaler gold service
cf delete-service -f scale-gold
