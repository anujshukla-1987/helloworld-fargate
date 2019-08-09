#!/bin/sh

BUCKET_NAME=helloWorldFromAnuj

## Creates S3 bucket
aws s3 mb s3://$BUCKET_NAME

## S3 cloudformation deployments

### Base
aws s3 cp cloudformation/infra/fargate-cluster.yaml s3://$BUCKET_NAME/resources/service-helloworld/cloudformation/infra/fargate-cluster.yaml
aws s3 cp cloudformation/infra/fargate-service.yaml s3://$BUCKET_NAME/resources/service-helloworld/cloudformation/infra/fargate-service.yaml
aws s3 cp cloudformation/infra/vpc-networking.yaml s3://$BUCKET_NAME/resources/service-helloworld/cloudformation/infra/vpc-networking.yaml

### CI/CD
aws s3 cp cloudformation/build/codebuild.yaml s3://$BUCKET_NAME/resources/service-helloworld/cloudformation/build/codebuild.yaml
