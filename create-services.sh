#!/bin/bash

# Creates the necessary CF services
# Make sure you're targeted and logged in to the right CF endpoint
# prior to running this script.

# You only need to run this once in each CF environment / space.

# Create the RabbitMQ service for payment-service and payment-history-service
cf create-service p-rabbitmq standard payment-mq

# Create the MySQL service for payment history service
cf create-service p-mysql 100mb-dev payment-history-service-db

# Create the MySQL service for consumer messaging service
cf create-service p-mysql 100mb-dev consumer-messaging-db

# Create the MySQL service for payment service
cf create-service p-mysql 100mb-dev payment-service-db

# Create the auto-scaler gold service
cf create-service app-autoscaler gold scale-gold
