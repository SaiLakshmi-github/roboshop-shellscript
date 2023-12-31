#!/bin/bash

Names=("web" "cart" "mongodb" "mysql" "redis" "user" "shipping" "catalogue" "rabbitmq" "payment" "dispatch")
Instance_Type=""
Image_id=ami-03265a0778a880afb
Security_id=sg-09fed927cbd854100
for i in "${Names[@]}"
do 
if [[$i == "mongodb" || $i == "mysql" ]]
then
Instance_Type="t3.medium"
else
Instance_Type="t2.micro"
fi
echo "creating $i instance"
IP_address=$(aws ec2 run-instances --image-id $Image_id --instance-type $Instance_Type --security-group-ids $Security_id --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" | jq -r '.Instances[0].PrivateIpAddress')
echo "created $i instance: $IP_address"
done