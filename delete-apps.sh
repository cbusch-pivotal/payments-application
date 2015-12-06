# Delete all apps

cf delete payments -f -r
cf delete payment-service -f -r
cf delete payment-history-service -f -r
cf delete consumer-messaging-service -f -r
cf delete payments-eureka-server -f -r

# only in dev and test
cf delete phpmyadmin-consumer -f -r
cf delete phpmyadmin-pay -f -r
cf delete phpmyadmin-pay-hist -f -r
