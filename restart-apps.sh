# Restart all apps

cf stop payments 
cf stop payment-service 
cf stop payment-history-service 
cf stop consumer-messaging-service 
cf stop payments-eureka-server 

cf start payments-eureka-server 
cf start payment-service 
cf start payment-history-service 
cf start consumer-messaging-service 
cf start payments 

