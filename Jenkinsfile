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
        always {
            emailext attachLog: true, body: 'tt', replyTo: 'david.oc4096@gmail.com', subject: 'Leroy Jenkins!', to: 'david.oc4096@gmail.com'

        }
    }
}
