pipeline {
    agent any  // This should be inside the pipeline block
    tools {
        maven 'maven'
    }

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

         stage('Push the artifacts into Nexus artifactory') {
            steps {
               nexusArtifactUploader artifacts: [[artifactId: 'microservice-one', classifier: '', file: 'target/microservice-one.war', type: 'war']], credentialsId: '5825da7b-5429-4562-8c7b-373f35df4ab3', groupId: 'com.techworldwithmurali', nexusUrl: '18.234.108.78:8081/', nexusVersion: 'nexus3', protocol: 'http', repository: 'tech-snapshots', version: '1.0-SNAPSHOT'
            }
         }     
       
    }
}
