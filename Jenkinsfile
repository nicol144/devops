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
                git 'https://github.com/nicol144/devops.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE}:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('', DOCKER_CREDENTIALS_ID) {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    withCredentials([file(credentialsId: KUBECONFIG_CREDENTIALS_ID, variable: 'KUBECONFIG')]) {
                        sh 'kubectl apply -f deployment.yaml'
                    }
                }
            }
        }
    }
}
