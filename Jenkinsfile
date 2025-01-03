pipeline {
    agent any

    environment {
        // Define the environment variables
        SONARQUBE_URL = 'http://3.84.129.174:9001'  // URL of SonarQube server
        SONARQUBE_TOKEN = 'sqa_e706ab9698742ad7419048eeda9060c3d953adda'  // Token for authentication with SonarQube (if required)
        TOMCAT_URL = 'http://3.84.129.174:8082'  // Tomcat server URL for deployment
        NEXUS_REPOSITORY = 'http://3.84.129.174:8081/repository/maven-releases/'  // Nexus repository URL
    }

    stages {
        stage('Checkout') {
            steps {
                // Perform the Git checkout with specified parameters
                git branch: 'main', 
                    credentialsId: '6a1fa75d-070b-4816-a291-00f99206b51a', 
                    url: 'https://github.com/nicol144/devops.git'
            }
        }

        stage('Build') {
            steps {
                // Build the project (for example, using Maven to package the app as a .war file)
                sh 'mvn clean install'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    // Run SonarQube scan
                    withSonarQubeEnv('SonarQube') {
                        sh 'mvn sonar:sonar -Dsonar.projectKey=my_project_key'
                    }
                }
            }
        }

        stage('Wait for SonarQube Analysis') {
            steps {
                script {
                    // Wait until the SonarQube analysis is finished
                    timeout(time: 1, unit: 'HOURS') {
                        waitForQualityGate abortPipeline: true
                    }
                }
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                script {
                    // Deploy the .war file to Tomcat (assuming the war file is in target/)
                    def warFile = 'hello-world-1.0-SNAPSHOT.jar'
                    sh """
                    curl -u admin:admin -T ${warFile} ${TOMCAT_URL}/manager/text/deploy?path=/myapp&update=true
                    """
                }
            }
        }

        stage('Push to Nexus') {
            steps {
                script {
                    // Optionally, push the artifact to Nexus (requires Nexus Repository Manager)
                    def artifactFile = 'hello-world-1.0-SNAPSHOT.jar'
                    sh """
                    curl -u admin:admin --upload-file ${artifactFile} ${NEXUS_REPOSITORY}/your-app.war
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
