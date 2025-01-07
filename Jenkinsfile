pipeline {
    agent any
    tools {
        maven 'maven'
        sonar 'sonar'
    }

    

    stages {
         stage('Clone the repository'){
        steps{
          git branch: 'static-code-analysis-jenkinsfile', credentialsId: '43a2b28e-66fd-4af9-8866-97130d12fe8a', url: 'https://github.com/nicol144/devops.git'
          
        } 
      }
      stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('Static code analysis') {
            steps {
        withSonarQubeEnv('sonar') {
                    sh 'sonar -Dproject.settings=sonar.properties'
                }
                }
                
            }
    }
}
