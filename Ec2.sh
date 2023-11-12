#!/bin/bash

Names=("web" "cart" "mongodb" "mysql" "redis" "user" "shipping" "catalogue" "rabbitmq" "payment" "dispatch")

for i in "${Names[@]}"
do 
echo "Name:$i"
done