

	pipeline {
		agent {
			label 'Java-17'
		}
		tools {
			maven "Maven-3.9.9"
		}

		stages {
			stage('Clone the git repository') {
				steps {
				  git branch: 'build-jenkinsfile', credentialsId: 'github-credentials', url: 'https://github.com/nicol144/devops.git'
				  
				}
			}
			
			stage('Build the code'){
				steps {
					sh 'mvn clean package'
				}
				
			}
		}
	}
