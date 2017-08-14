# ascent-vault-ami
Repository for [Packer](https://www.packer.io/) script for creating Consul and Vault AMIs.

# Dev Setup
Install [Packer](https://www.packer.io/) on your local machine.

## Setting AWS Authentication values
Create a __aws-auth.json__ file somewhere on your local machine with the following contents:
```json
{
  "aws_access_key": "<your aws access key here>",
  "aws_secret_key": "<your secret key here>"
}
```

# Building the AMIs
1. After creating your __aws-auth.json__ file, run the following command:
```bash
./build.sh <path to aws-auth.json>
```
2. This will create the following AMIs in your AWS environment
* ascent-vault {{timestamp}}
* ascent-consul-server {{timestamp}}
* ascent-consul-client {{timestamp}}
