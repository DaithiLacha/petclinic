pipeline {
  environment {
    registry = "daithilacha/petclinic"
    registryCredential = "Docker"
    dockerImage = ''
  }
  agent any
  tools {
    maven 'mvn'
  }
  stages {
    stage ('Build') {
      steps {
        sh 'mvn package'
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
		      docker.withRegistry('https://index.docker.io/v1/','Docker') {
		        dockerImage.push()
		      }
		    }
		  }
		}
  }
}
