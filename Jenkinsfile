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
                directory = consul
                vars = [aws_region: 'us-gov-west-1']
                packerFile = 'consul-server.json'
            }

            stage('Generate Vault Certificates') {
                dir("private-tls-cert") {
                    sh 'terraform init'
                    sh "terraform apply"
                }
            }

            //Build Consul AMI
            packerBuild {
                directory = .
                vars = [aws_region: 'us-gov-west-1']
                packerFile = 'vault.json'
            }
        } finally {
            //Send build notifications if needed
            notifyBuild(currentBuild.result)
        }
    }