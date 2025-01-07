pipeline {
    agent any
    tools {
        maven 'maven'

    

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
        withSonarQubeEnv('sonarqube') {
                    sh '/opt/sonar-scanner/bin/sonar-scanner -Dproject.settings=sonar.properties'
                }
                }
                
            }
    }
}
