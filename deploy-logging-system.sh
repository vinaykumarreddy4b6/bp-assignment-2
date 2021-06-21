cd docker-steps
login to docker hub account to pull splunk image
docker login -u <username> -p <pwd>
docker pull store/splunk/enterprise
export AWS_ACCESS_KEY_ID=<aws access key>
export AWS_SECRET_ACCESS_KEY=<aws secret key>
terraform init
terraform apply --auto-approve
image_url=`terraform output ecr_repo_url | sed -e 's/^"//' -e 's/"$//'`
echo "image url is $image_url"
aws_ecr_url=`echo $image_url | cut -d/ -f1`
echo "aws repo url is $aws_repo_url"
image=$image_url":latest"
#aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin $aws_ecr_url
#docker tag store/splunk/enterprise:latest $image
#docker push $image
cd ../deploy-application
export AWS_ACCESS_KEY_ID=<aws access key>
export AWS_SECRET_ACCESS_KEY=<aws secret key>
export TF_VAR_image=$image
terraform init
terraform apply --auto-approve