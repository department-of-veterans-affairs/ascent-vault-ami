export PRIVATE_IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
export VAULT_REDIRECT_ADDR="https://$PRIVATE_IP:8200"