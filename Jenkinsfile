pipeline {
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
  }
}
