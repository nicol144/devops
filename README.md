+ <b>Author: Moole Muralidhara Reddy</b></br>
+ <b>Email:</b> techworldwithmurali@gmail.com</br>
+ <b>Website:</b> https://techworldwithmurali.com </br>
+ <b>Youtube Channel:</b> Tech World With Murali</br>
+ <b>Description:</b> Below are the steps outlined for Jenkins Pipeline - building and pushing artifacts(war) to Nexus Artifactory</br>

## Jenkins Pipeline - Build and Push to Nexus Artifactory

### Prerequisites:
  + Jenkins is installed
  + Nexus artifactory is installed
  + Github token generate

### Step 1: Install and configure the jenkins plugins
  + git
  + maven integration
  + Nexus artifact Uploder
  
### Step 2: Create the user in Nexus
```xml
UserName: devops
Password: Techworld@2580
```
### Step 3: Create the maven repository in Nexus
```xml
Repository Name: tech-snapshots and tech-releases
```
### Step 4: Create the Jenkins Pipeline job
```xml
Job Name: build-and-push-to-nexus-pipeline
```
### Step 5: Configure the git repository
```xml
GitHub Url: https://github.com/techworldwithmurali/microservice-one.git
Branch : build-and-push-to-nexus-jenkinsfile
```
### Step 6: Write the Jenkinsfile
  + ### Step 6.1: Clone the repository 
```xml
stage('Clone the Repository ') {
            steps {
               git branch: 'build-and-push-to-nexus-jenkinsfile', credentialsId: 'github-credentials', url: 'https://github.com/techworldwithmurali/microservice-one.git'
               
               
            }
        }
```
  + ### Step 6.2: Build the code
```xml
stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
```
  + ### 6.3: Push the artifacts to Nexus repository
```xml
 stage('Push the artifacts into Nexus artifactory') {
           steps {
               nexusArtifactUploader artifacts: [[artifactId: 'microservice-one', classifier: '', file: 'target/microservice-one.war', type: 'war']], credentialsId: 'nexus', groupId: 'com.techworldwithmurali', nexusUrl: 'nexus.techworldwithmurali.in', nexusVersion: 'nexus3', protocol: 'https', repository: 'tech-snapshots', version: '1.0-SNAPSHOT'
            }
        }
  
```

### Step 8: Verify whether artifact(war) is published or not in Nexus Artifactory.

#### Congratulations. You have successfully published the artifact(war) file in Nexus repository using Jenkins Pipeline job.

