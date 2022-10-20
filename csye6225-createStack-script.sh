#!/bin/bash

echo "A new VPC is being created..."


aws cloudformation describe-stacks --profile $8 --stack-name $1 --region $3  >/dev/null 2>&1 
if [ $? -eq 0 ]
then
	echo "Stack creation failed: Stack with $1 name already exisits"
	exit
fi

status=$(aws cloudformation create-stack --profile $8 \
--stack-name $1 \
--template-body file://./csye6225-infra.yml \
--region $3 \
--parameters \
ParameterKey=vpcName,ParameterValue=$2 \
ParameterKey=vpcCidr,ParameterValue=$4 \
ParameterKey=subnetACidr,ParameterValue=$5 \
ParameterKey=subnetBCidr,ParameterValue=$6 \
ParameterKey=subnetCCidr,ParameterValue=$7 \
ParameterKey=AMI,ParameterValue=$9 \
ParameterKey=KeyName,ParameterValue=${10} \
--on-failure DELETE)

if [ $? -eq 0 ]
then
    echo "Waiting for $1 to create completion..."
    aws cloudformation wait stack-create-complete --profile $8 --stack-name $1 --region $3 
    if [ $? -eq 0 ]
    then
        echo "Stack has been successfully created"
        echo $status
    else
        echo "Failed: Failed to deploy the stack"
        echo $status
        exit
    fi
else
    echo "Failed: Failed to deploy the stack"
    echo $status
    exit
fi