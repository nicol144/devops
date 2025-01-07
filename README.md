+ <b>Author: Moole Muralidhara Reddy</b></br>
+ <b>Email:</b> techworldwithmurali@gmail.com</br>
+ <b>Website:</b> https://techworldwithmurali.com </br>
+ <b>Youtube Channel:</b> Tech World With Murali</br>
<<<<<<< HEAD
+ <b>Description:</b> Below are the steps outlined for building and generating the WAR file using Jenkins Freestyle jobs </br>

## Jenkins Freestyle - Build and Push to Jfrog Artifactory
=======
+ <b>Description:</b> Below are the steps outlined for the Jenkins Pipeline to build the application and generate the WAR file</br>

## Jenkins Pipeline - Build the application
>>>>>>> bd616ec012c750922b2ee2c6b00de456d16c32b9

### Prerequisites:
  + Jenkins is installed
  + Github token generate

### Step 1: Install and configure the jenkins plugins
  + git
  + maven integration
  
 HEAD

### Step 2: Create the Jenkins Freestyle job
```xml
Job Name: build-freestyle
=======
### Step 2: Create the Jenkins Pipeline job
```xml
Job Name: build-pipeline
>>>>>>> bd616ec012c750922b2ee2c6b00de456d16c32b9
```
### Step 3: Configure the git repository
```xml
GitHub Url: https://github.com/techworldwithmurali/microservice-one.git
<<<<<<< HEAD
Branch : bbuild-freestyle
```
### Step 4: Configure the Invoke top-level maven targets
      clean install
### Step 5: Verify whether artifact(war) is generated or not

#### Congratulations. You have successfullygenerated the war file using Jenkins Freestyle job.
=======
Branch : build-jenkinsfile
```
### Step 4: Write the Jenkinsfile
  + ### Step 4.1: Clone the repository 
```xml
stage('Clone the Repository ') {
            steps {
               git branch: 'build-jenkinsfile', credentialsId: 'github-credentials', url: 'https://github.com/techworldwithmurali/microservice-one.git'
               
               
            }
        }
```
  + ### Step 4.2: Build the code
```xml
stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
```

### Step 5: Verify whether the artifact (war) is generated or not

#### Congratulations! You have successfully generated the artifact (WAR) file using the Jenkins Pipeline job.
>>>>>>> bd616ec012c750922b2ee2c6b00de456d16c32b9

ok
