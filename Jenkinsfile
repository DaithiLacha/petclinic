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
    stage ('Compile Stage') {
      steps {
        sh 'mvn clean compile'
      }
    }

  }
  post {
        success {
            emailext attachLog: true, body: 'build success', replyTo: 'david.oc4096@gmail.com', subject: 'Leroy Jenkins!', to: 'david.oc4096@gmail.com'
        }
        failure {
          emailext attachLog: true, body: 'build failure', replyTo: 'david.oc4096@gmail.com', subject: 'Leroy Jenkins!', to: 'david.oc4096@gmail.com'
        }
    }
}
