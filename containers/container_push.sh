# Create ECR (if not already existing)
aws ecr create-repository --repository-name "service-helloWorld-api"

ACCOUNT_ID=$(aws sts get-caller-identity |  jq -r '.Account')
$(aws ecr get-login --no-include-email --region us-east-1)

docker build -t service-helloWorld-api ./helloworld-api/
docker tag service-helloWorld-api:latest $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/service-helloWorld-api:latest
docker push $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/service-helloWorld-api:latest

