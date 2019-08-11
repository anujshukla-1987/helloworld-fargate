# helloworld-fargate

This is a simple nodeJS project running in fully managed fargate cluster in multiAZ environment.

Please see Reference Architecture in folder arch-img

Steps to run application.

1. Checkout the project.
2. In cloudformation_deploy.sh rename your bucket name in variable "BUCKET_NAME".
3. Setup awscli on your machine.
4. Run cloudformation_deploy.sh which will copy all the nested stacks in S3 bucket.
5. Now time to build our first image into ECR. 
  * Go to helloworld-fargate/containers/container_push.sh.
  * Change the region to your working region. It is configured to use us-east-1 as of now
  * If you dont have JQ installed add your account id in "ACCOUNT_ID" variable.
  * Run container_push.sh. It will create repo and tag your image there.

6. Now time to deploy our architecture.
* Go to helloworld-fargate/cloudformation/deployment-params.json. This file is our configuration master data where configuration can be altered as per need and it is referenced in cloudformations.
* Go to project root helloworld-fargate and run below aws cli command to create above described AWS fargate architecture for you.

```bash
aws cloudformation create-stack \
    --stack-name "stack-helloworld" \
    --template-body file://cloudformation/deployment.yaml \
    --parameters file://cloudformation/deployment-params.json \
    --capabilities CAPABILITY_IAM
```

    
7. Once stack is completed completely you will get fargate service url for Application.

8. This stack is also creating a CodeBuild pipeline which can do rolling updates to the infra. So chnage anything in app.js and commit it again. Go to Codebuild console and build the project already configured. It will trigger build pipeline which automatically updates Fargate cluster with new containers while draining the old ones

