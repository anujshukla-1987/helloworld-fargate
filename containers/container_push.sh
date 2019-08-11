# Create ECR (if not already existing)
aws ecr create-repository --repository-name "service-helloworld-api"

ACCOUNT_ID=$(aws sts get-caller-identity |  ./jq-win64.exe -r '.Account')
$(aws ecr get-login --no-include-email --region us-east-1)

docker build -t service-helloworld-api ./helloworld-api/
docker tag service-helloworld-api:latest $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/service-helloworld-api:latest
docker push $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/service-helloworld-api:latest

