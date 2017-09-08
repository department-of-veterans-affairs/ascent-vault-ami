pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git(url: 'https://github.com/department-of-veterans-affairs/ascent-vault-ami', branch: 'master', credentialsId: 'VA GitHub')
      }
    }
  }
}