@Library('ascent') _

packerPipeline {
    directory = 'consul'
    packerFile = 'consul-server.json'
    vars = [aws_region: 'us-gov-west-1']
}

packerPipeline {
    packerFile = 'vault.json'
    vars = [aws_region: 'us-gov-west-1']
}