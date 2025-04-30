DevOps App: CI/CD with Docker, Jenkins, and Grafana

This project demonstrates a complete CI/CD pipeline using Docker, Jenkins, Terraform, and Ansible, and sets the foundation for monitoring with Grafana.

🔧 Project Structure

DevopsApp/
├── Dockerfile
├── docker-compose.yml
├── Jenkinsfile
├── app/             # Ruby on Rails application
├── terraform/       # Infrastructure as Code
└── ansible/         # Configuration Management

🚀 How to Run This Project

1. Clone the Repository

git clone https://github.com/namanupmanyu/DevopsApp.git
cd DevopsApp

2. Build and Run with Docker Compose

docker-compose up -d --build

3. Check Container Status

docker ps

4. Access the Application

Localhost: http://localhost:4000

EC2 Instance: http://:4000

⚙️ Jenkins CI/CD Pipeline

5. SSH into EC2 and Add Jenkins to Docker Group

ssh -i your-key.pem ec2-user@<your-ec2-public-ip>
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins

6. Configure Jenkins

Create a Pipeline job in Jenkins UI.

Connect it to this GitHub repo.

Use the provided Jenkinsfile for build steps.

Set Docker Hub credentials using a Jenkins Credential ID.

🛠 Tools Used

Docker & Docker Compose – Containerize and deploy the app

Jenkins – Automate CI/CD pipeline

Terraform – Provision EC2 infrastructure

Ansible – Install and configure software

Grafana (Upcoming) – Monitor logs and metrics

🧪 Jenkins Pipeline Stages

Build Docker Image

Push Image to Docker Hub

Deploy Using Docker Compose

Verify Container is Running and Healthy

✅ Sample Commands (No Shell Format)

Clone project: git clone https://github.com/namanupmanyu/DevopsApp.git

Change directory: cd DevopsApp

Start app: docker-compose up -d --build

Check status: docker ps

Access app: http://<your-ec2-ip>:4000

Jenkins Docker permission: sudo usermod -aG docker jenkins && sudo systemctl restart jenkins


