pipeline {
    agent any  // This should be inside the pipeline block

    stages {
        stage('Clone the repository') {
            steps {
                git branch: 'build-and-push-to-nexus-jenkinsfile', credentialsId: '43a2b28e-66fd-4af9-8866-97130d12fe8a', url: 'https://github.com/nicol144/devops.git'
            }
        }
        
        stage('Build the code') {
            steps {
                sh 'mvn clean install'
            }
        }
        
       
    }
}
