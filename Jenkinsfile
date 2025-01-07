
pipeline {
    agent any  // Use 'any' for Jenkins to choose an available agent (you can set this to a specific label if needed)
    
    tools {
        maven "3.9.9"   // Ensure Maven is configured in Jenkins
    }

    stages {
        stage('Clone the Git repository') {
            steps {
                // Ensure 'github-credentials' is correctly set up in Jenkins
                git branch: 'build-jenkinsfile', credentialsId: 'github-credentials', url: 'https://github.com/nicol144/devops.git'
            }
        }
        
        stage('Build the code') {
            steps {
                // Run Maven build command
                sh 'mvn clean package'
            }
        }
    }
}
