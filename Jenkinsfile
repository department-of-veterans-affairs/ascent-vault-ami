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
                vars = [aws_region: 'us-gov-west-1', vpc_id: "${this.env.VPC_ID}", subnet_id: "${this.env.SUBNET_ID}"]
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
                vars = [aws_region: 'us-gov-west-1', vpc_id: "${this.env.VPC_ID}", subnet_id: "${this.env.SUBNET_ID}"]
                packerFile = 'vault.json'
            }
        } finally {
            //Send build notifications if needed
            notifyBuild(currentBuild.result)
        }
    }