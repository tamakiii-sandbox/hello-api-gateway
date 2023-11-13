#!/bin/bash

# Configure AWS CLI for LocalStack
aws configure set aws_access_key_id test
aws configure set aws_secret_access_key test
aws configure set default.region us-east-1

# Create S3 bucket
aws --endpoint-url=http://localstack:4566 s3 mb s3://your-bucket-name

# Create Lambda function
zip function.zip index.js
aws --endpoint-url=http://localstack:4566 lambda create-function \
    --function-name ContactFormLambda \
    --zip-file fileb://function.zip \
    --handler index.handler \
    --runtime nodejs18.x \
    --role arn:aws:iam::000000000000:role/irrelevant

# Create API Gateway
# ...

# Cleanup
rm function.zip
