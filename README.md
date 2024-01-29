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
`ec2_configuration` : AWS instance configuration for programmatic access

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
- In the project configuration, scroll down to the "Pipeline" section. 
  and write the pipeline script directly in the script box and click "save."
- click `build now`

  <img src="https://github.com/olaeid-code/MultiCloudDevOpsProject/assets/75432566/9e8d4451-073f-46b6-ae23-35df6b320647" width="500" height="300" >

  
### pipeline script Explanation:
 `Checkout` stage fetches the source code from your version control system (e.g., Git).
 
 `Build Image` stage builds the Docker image using the specified Dockerfile.
 
 `Push Image` stage pushes the built Docker image to a Docker registry.

 ### Credentials
 - Configure Docker credentials in Jenkins as "Secret text" or "Secret file" and refer to them in the script.

# Automated Deployment Pipeline

<img src="https://github.com/olaeid-code/MultiCloudDevOpsProject/assets/75432566/aafe7342-0364-42d1-8b6c-0ba48344324f" width="500" height="300" >

### Integrate SonarQube and openshift with Jenkins

#### SonarQube installation
###### Prerequisite:
- Java 17
  

 






