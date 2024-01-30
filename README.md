# MultiCloudDevOpsProject
## Terraform module
### Argumentes: `variables.tf`
- `vpc_cidr`
- `public_subnet_cidr`
- `private_subnet_b_cidr`
- ` private_subnet_c_cidr`
- `region`
### Attributes: `outputs.tf`
- `vpc_id`
- `public_subnet_id`
- ` private_subnet_b_id`
- `private_subnet_b_id`


# Configuration Management with Ansible
#### directory structure for the Ansible:
 `ansible_ec2_config`

### ansible roles
`Environmen_vars` : Set up environment variables for Jenkins and SonarQube packages

`packages1` : Install the required packages (e.g., Git, Docker, Java)

`SonarQube` : Install the required packages for SonarQube

`jenkins` :	Install the required packages for jenkins

# Containerization with Docker

### Deliver Dockerfile for building the application image

 ```bash
   docker build -t my-app:latest .
   ```

<img src="https://github.com/olaeid-code/MultiCloudDevOpsProject/assets/75432566/ebff67f8-529d-45ef-8d2c-1f081d35b6d2" width="600" height="400" >

# Continuous Integration with Jenkins
- Open Jenkins and click on "New Item" to create a new job 
- Enter an item name `CI-jenkines` and select "pipeline" as the job type and click "OK."
 - Configure Docker credentials in Jenkins as "Secret text" or "Secret file" and refer to them in the script.
   Manage Jenkins → Credentials → System → Global credentials → Add credentials

   
- In the project configuration, scroll down to the "Pipeline" section. 
  and write the pipeline script directly in the script box and click "save."
  
- click `build now`

  <img src="https://github.com/olaeid-code/MultiCloudDevOpsProject/assets/75432566/9e8d4451-073f-46b6-ae23-35df6b320647" width="600" height="300" >

  
### pipeline script Explanation:
 `Checkout` stage fetches the source code from your version control system (e.g., Git).
 
 `Build Image` stage builds the Docker image using the specified Dockerfile.
 
 `Push Image` stage pushes the built Docker image to a Docker registry.


# Automated Deployment Pipeline

<img src="https://github.com/olaeid-code/MultiCloudDevOpsProject/assets/75432566/aafe7342-0364-42d1-8b6c-0ba48344324f" width="500" height="300" >

### Integrate SonarQube and openshift with Jenkins

- Add SonarScanner plugin in Jenkins

  Manage Jenkins → Manage Plugins → Available Plugins → Search “SonarScanner” → Select checkbox → Install

- Configure Jenkins SonarQube Scanner
  
  Manage Jenkins → Tools  → 

  Provide a name, check Install automatically , select a version and save.

  <img src="https://github.com/olaeid-code/MultiCloudDevOpsProject/assets/75432566/82ba6e20-85cd-488f-aa02-dd9b0b750034" width="600" height="300">

 -  Add the generated token in your sonnarqube project to Jenkins credentials
 
- Configure SonarQube server information, including the server URL and authentication token

  <img src="https://github.com/olaeid-code/MultiCloudDevOpsProject/assets/75432566/c3d2d30e-435e-4fe8-aebc-73e943d7473f" width="600" height="500">

- Install OpenShift Client Plugin in Jenkins
  
- Configure OpenShift in Jenkins
  Configure OpenShift in Jenkins by providing the necessary credentials and server information

- Create a Jenkins pipeline script

- Run Jenkins Pipeline
  
- navigate to openshift clustter and check your deployed application

  <img src="https://github.com/olaeid-code/MultiCloudDevOpsProject/assets/75432566/8132a0b0-0a50-485d-b11b-425a8e0a3f56" width="600" height="500">
  
# Monitoring and Logging on OpenShift 

- install OperatorHub Red Hat OpentShift Logging

  <img src="https://github.com/olaeid-code/MultiCloudDevOpsProject/assets/75432566/11394d92-c8c3-433a-a8ed-141c59fab9b9" width="600" height="200">

- install OpenShift ElasticSearch OperatorHub

   <img src="https://github.com/olaeid-code/MultiCloudDevOpsProject/assets/75432566/44dc7942-b66d-4b17-9a44-d250d4d46852" width="600" height="300">


- create cluster logging instance

   <img src="https://github.com/olaeid-code/MultiCloudDevOpsProject/assets/75432566/89653e12-bcf9-479d-9208-4fb99c4ff8bf" width="600" height="300">

- select kibana route link

- Log in using the same credentials you use to log in to the OpenShift Container Platform console.

   <img src="https://github.com/olaeid-code/MultiCloudDevOpsProject/assets/75432566/7b218aa9-1b27-4255-a669-b919d9aa30d8" width="600" height="300">

- The Kibana interface launches

  <img src="https://github.com/olaeid-code/MultiCloudDevOpsProject/assets/75432566/1fab55b8-d323-4be8-a3ed-fb456a32c531" width="600" height="200">

- Search and browse your data using the Discover page

- Chart and map your data using the Visualize page

- Create and view custom dashboards using the Dashboard page

- Connect Kibana with Elasticsearch

- create index pattern

- Start Exploring your Data!


# AWS integration in the Terraform Code

- ### Create an S3 Bucket for Terraform Backend:
  Create an S3 bucket to store Terraform state files. This is where Terraform state will be stored remotely.

- ### Configure Terraform Backend for S3:
  Terraform configuration to use the newly created S3 bucket as the backend for storing state files.

  `bucket`          = "your-unique-bucket-name"
  
  `key`             = "terraform.tfstate"

  `region`          = "your-aws-region"

  `encrypt`         = "true"

  `dynamodb_table`  = "terraform_locks"

- ### Enable Remote State Configuration:
  Run `terraform init` to initialize configuration and configure Terraform to use the S3 backend.

- ### Create CloudWatch Alarms for Monitoring:

- ensure that cloudwatch metrics and logs are enabled into bucket settings.
  
- Define CloudWatch alarms using terraform to monitor metrics of s3 bucket.
  
- create backend terraform file to define cloudwatch service

  
 ```bash

# cloudwatch.tf
resource "aws_cloudwatch_metric_alarm" "high_cpu_utilization" {
  alarm_name          = "HighCPUUtilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 90

  dimensions = {
    InstanceId = "instance_id"
  }

  alarm_actions = ["arn:aws:sns:us-east-1:_account_id:_sns_topic"]
}

   ```

- ### Update IAM Roles and Policies:
   IAM role used by your Terraform script has the necessary permissions to create and modify resources, as well as permissions to write to the S3 bucket and access CloudWatch.

  
- ### Apply Terraform Configuration:
  run `terraform init` followed by `terraform apply` to apply the Terraform configuration.

  - This will create the S3 bucket for the Terraform backend and set up CloudWatch alarms.

  






