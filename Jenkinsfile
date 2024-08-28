pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'docker1'
        DOCKER_IMAGE = 'adi144/apache-webpage'
        KUBECONFIG_CREDENTIALS_ID = 'kubernetes'
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Cloning the repository and specifying the branch name explicitly
                git url: 'https://github.com/nicol144/devops.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Building the Docker image with a unique tag based on the build number
                    dockerImage = docker.build("${DOCKER_IMAGE}:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Logging in to Docker registry and pushing the Docker image
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Applying the Kubernetes deployment configuration
                    withCredentials([file(credentialsId: KUBECONFIG_CREDENTIALS_ID, variable: 'KUBECONFIG')]) {
                        sh 'kubectl apply -f deployment.yaml'
                    }
                }
            }
        }
    }
}
