+ <b>Author: Moole Muralidhara Reddy</b></br>
+ <b>Email:</b> techworldwithmurali@gmail.com</br>
+ <b>Website:</b> https://techworldwithmurali.com </br>
+ <b>Youtube Channel:</b> Tech World With Murali</br>
<<<<<<< HEAD
+ <b>Description:</b> Below are the steps outlined for manually building and pushing artifacts(war) to Nexus Artifactory</br>

## Manually - Build and Push to Nexus Artifactory

### Prerequisites:
+ Git is installed
+ Maven is installed
+ Nexus Artifactory is installed
+ Create maven repository in Nexus

### Step 1: Clone the repository
  ```xml
  git clone https://github.com/techworldwithmurali/microservice-one.git
  Branch Name: build-and-push-to-nexus
```
### Step 2: Create the user in Nexus
```xml
User Name: moole
```
### Step 3: Create the maven repository in Nexus
```xml
Repository Name: tech-snapshots
```
### Step 4: Update the Nexus Artifactory details in pom.xml
```xml
 <distributionManagement>
      <snapshotRepository>
        <id>nexus-snapshots</id>
        <url>https://nexus.techworldwithmurali.in/repository/tech-snapshots/</url>
      </snapshotRepository>
      <repository>
        <id>nexus-releases</id>
        <url>https://nexus.techworldwithmurali.in/repository/tech-releases/</url>
      </repository>
    </distributionManagement>
```
### Step 5: Update the Nexus credentials in settings.xml
```xml
<servers>
    <server>
      <id>nexus-snapshots</id>
      <username>moole</username>
      <password>Techworld@2580</password>
    </server>
    <server>
      <id>nexus-releases</id>
      <username>moole</username>
      <password>Techworld@2580</password>
    </server>
  </servers>
```
### Step 6: Run the below command to push the artifacts to nexus Artifactory.
```sh
mvn deploy
```
### Step 7: Verify whether artifact(war) is published or not in nexus Artifactory.


#### Congratulations. You have successfully published the artifact(war) file in nexus repository.
=======
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
>>>>>>> ecc5319f8808c4aa1692c4ea86844019a6ddd757

perfect
