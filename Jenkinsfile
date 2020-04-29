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
    stage('Deploy to production') {
      steps {
        sshPublisher(publishers: [sshPublisherDesc(configName: 'ansible-ssh', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '/usr/local/bin/ansible-playbook -e JENKINS_BUILD_NUMBER=$BUILD_NUMBER -i /etc/ansible/hosts /etc/ansible/playbook.yml', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '', usePty: true)], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
      }
    }
  }
}
