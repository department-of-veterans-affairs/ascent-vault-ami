function abspath() {
    # generate absolute path from relative path
    # $1     : relative filename
    # return : absolute path
    if [ -d "$1" ]; then
        # dir
        (cd "$1"; pwd)
    elif [ -f "$1" ]; then
        # file
        if [[ $1 == */* ]]; then
            echo "$(cd "${1%/*}"; pwd)/${1##*/}"
        else
            echo "$(pwd)/$1"
        fi
    fi
}

VAR_FILE=`abspath $1`
BASE_DIR=$( cd "$(dirname "$0")" ; pwd -P )
CURRENT_DIR=`pwd`

# Build Consul Server AMI
cd $BASE_DIR/consul
packer build -var-file $VAR_FILE consul-server.json

# Build Consul Client AMI
packer build -var-file $VAR_FILE consul-server.json

cd $BASE_DIR
# Build Vault Server AMI
packer build -var-file $VAR_FILE vault.json

cd $CURRENT_DIR