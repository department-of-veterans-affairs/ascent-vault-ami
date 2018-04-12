@Library('ascent') _

node {
        properties([
            disableConcurrentBuilds(),
            buildDiscarder(logRotator(daysToKeepStr: '5', numToKeepStr: '5'))
        ])

        try {
            stage('Checkout SCM') {
                checkout scm
            }
            
            //Build Consul AMI
            packerBuild {
                directory = 'consul'
                vars = [aws_region: 'us-gov-west-1']
                packerFile = 'consul.json'
            }

            stage('Generate Vault Certificates') {
                dir("vault/private-tls-cert") {
                    sh 'terraform init'
                    sh "terraform apply -auto-approve"
                }
            }

            //Build Vault AMI
            packerBuild {
                directory = 'vault'
                vars = [aws_region: 'us-gov-west-1']
                packerFile = 'vault.json'
            }
        } finally {
            //Send build notifications if needed
            notifyBuild(currentBuild.result)
        }
    }