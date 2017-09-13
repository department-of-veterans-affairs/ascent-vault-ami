pipeline {
  agent any

  triggers {
    pollSCM('*/5 * * * *')
  }

  stages {

    stage('Checkout') {
      steps {
        git(url: 'https://github.com/department-of-veterans-affairs/ascent-vault-ami', credentialsId: 'github')
      }
    }
    stage('Build Consul Server AMI') {
      steps {
        // define the secrets and the env variables
        def secrets = [
            [$class: 'VaultSecret', path: 'secret/jenkins/aws', secretValues: [
                [$class: 'VaultSecretValue', envVar: 'AWS_ACCESS_KEY', vaultKey: 'access_key'],
                [$class: 'VaultSecretValue', envVar: 'AWS_SECRET_KEY', vaultKey: 'secret_key']]]
        ]

        wrap([$class: 'VaultBuildWrapper', vaultSecrets: secrets]) {
            dir('consul') {
                sh 'packer build -var "aws_access_key=$AWS_ACCESS_KEY" -var "aws_secret_key=$AWS_SECRET_KEY" consul-server.json'
            }
        }
      }
    }
  }
}