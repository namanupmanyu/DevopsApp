pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                dir('devapp') {
                    sh 'docker build -t nupmanyu/devops-app .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                dir('devapp') {
                    withCredentials([usernamePassword(
                        credentialsId: '19228d92-1e9c-4cce-87a2-bbbe76f06b9b',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )]) {
                        sh '''
                            echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                            docker push nupmanyu/devops-app
                        '''
                    }
                }
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                dir('devapp') {
                    sh 'docker-compose up -d --build --no-cache'
                }
            }
        }

        stage('Check Container') {
            steps {
                sh '''
                    if docker ps | grep nupmanyu/devops-app; then
                        echo "✅ Container is running!"
                    else
                        echo "❌ Container is NOT running!" && exit 1
                    fi
                '''
            }
        }
    }
}
