#! /bin/bash
# See Installation docs at https://www.vaultproject.io/docs/install/index.html

# Install Vault
curl -L -o vault.zip https://releases.hashicorp.com/vault/0.7.3/vault_0.7.3_linux_amd64.zip?_ga=2.14934389.212951297.1502214257-1515788750.1499111083
unzip vault.zip
sudo mv vault /usr/bin
sudo chmod 0755 /usr/bin/vault
sudo chown -R root:root /usr/bin/vault
rm vault.zip

# Configure Vault
sudo mkdir /etc/vault.d
sudo mv server.pem /etc/vault.d/server.pem
sudo mv server.key /etc/vault.d/server.key
sudo mv vault.hcl /etc/vault.d/vault.hcl
sudo mv vault-server.sh /etc/vault.d/vault-server.sh
sudo chown -R root:root /etc/vault.d
sudo chmod -R 0700 /etc/vault.d

# Install Vault as a Service
sudo mv vault.service /etc/systemd/system/vault.service
sudo chown root:root /etc/systemd/system/vault.service
sudo chmod 0700 /etc/systemd/system/vault.service

# Enable Service
sudo systemctl enable vault.service
