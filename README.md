
# DevOps Project: CI/CD Pipeline with Terraform, Ansible, Jenkins, Docker, Prometheus, Grafana and Ruby on Rails

This project demonstrates a complete CI/CD pipeline setup using **Terraform**, **Ansible**, **Jenkins**, **Docker**, **Grafana**, **Prometheus** and **Ruby on Rails**, with images pushed to **Docker Hub** and application deployed on an **AWS EC2 instance**.

---

## 🛠️ Technologies Used

- Terraform
- Ansible
- Jenkins
- Docker & Docker Compose
- Ruby on Rails
- GitHub
- AWS EC2
- Docker Hub
- Prometheus

---

## 📁 Project Structure
DevopsApp/ │ ├── Dockerfile ├── docker-compose.yml ├── Jenkinsfile 
├── playbook.yml ├── hosts.ini  ├── ansible ├── main.tf ├── variables.tf ├── terraform


## 🚀 Step-by-Step Setup Instructions

### 1. ✅ Install Dependencies on Local Machine

Make sure you have the following installed in your Local Machine(if using Linux):

sudo apt update
sudo apt install terraform -y
sudo apt install ansible -y


### 2. ☁️ Launch EC2 Instance Using Terraform

terraform init
terraform plan
terraform apply
After execution, note down the EC2 instance's public IP address.

### 3. ⚙️ Configure Ansible to Provision the EC2 Instance

3.1 Edit hosts.ini with EC2 IP:
[ec2]
<YOUR_EC2_PUBLIC_IP> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/your-key.pem

3.2 Run Ansible Playbook:

ansible-playbook -i hosts.ini playbook.yml
This will install Docker, Docker Compose, Jenkins on the EC2 instance.

### 4. 🔧 Setup Jenkins (on the EC2 instance)
Visit: http://<YOUR_EC2_PUBLIC_IP>:8080

Complete initial Jenkins setup:

4.1 Install plugins

4.2 Add admin user

4.3 Add Docker Hub credentials in Jenkins (with ID dockerhub-credentials)

### 5. 🔁 Create Jenkins Pipeline

5.1 Create a Pipeline project.

5.2 Under "Pipeline", choose:

5.2.1 Definition: Pipeline script from SCM

5.2.2 SCM: Git

5.2.3 Repository URL: https://github.com/namanupmanyu/DevopsApp.git

5.2.4 Branch: master (or your desired branch)

### 6. 🧪 Run the Jenkins Job

Jenkins will:

6.1 Clone your repo

6.2 Build Docker image using the Dockerfile

6.3 Push image to Docker Hub

6.4 Deploy container using docker-compose.yml

### 7. 🔍 Verify Everything Is Working

7.1 Confirm Image Is on Docker Hub

Visit: https://hub.docker.com/repository/docker/nupmanyu/devops-app

7.2 Confirm Container Is Running on EC2

ssh -i ~/.ssh/your-key.pem ubuntu@<EC2_PUBLIC_IP>

Check container:
docker ps

7.3 Access Your Rails App

Open in the browser:

http://<YOUR_EC2_PUBLIC_IP>:4000
You should see the Ruby on Rails app running!

7.4 Confirm Grafna container is Running

Open in the browser:
http://<YOUR_EC2_PUBLIC_IP>:3000

7.5 Confirm Prometheus Container is Running 

Open in the browser:
http://<YOUR_EC2_PUBLIC_IP>:9090

