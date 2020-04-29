pipeline {
  environment {
    registry = "daithilacha/petclinic"
    registryCredential = "DockerHub"
    dockerImage = ''
  }
  agent any
  tools {
    maven 'mvn'
  }
  stages {
    stage ('Compile Stage') {
      steps {
        sh 'mvn clean compile'
      }
    }
    stage ('Testing Stage') {
      steps {
        sh 'mvn test'
      }
    }
    stage ('SonarCloud Analysis') {
      steps {
        sh 'mvn verify sonar:sonar'
      }
    }
    stage ('Build') {
      steps {
        sh 'mvn package'
      }
    }
    stage ('Push to Nexus') {
      steps {
        sh 'mvn deploy'
      }
	  }
    stage ('Build Docker Image') {
		 steps {
		    script {
		    dockerImage = docker.build registry + ":$BUILD_NUMBER"
		    }
		  }
		}
		stage ('Push Image to registry') {
		  steps {
		    script {
		      docker.withRegistry('https://index.docker.io/v1/','DockerHub') {
		        dockerImage.push()
		      }
		    }
		  }
		}
  }
}
