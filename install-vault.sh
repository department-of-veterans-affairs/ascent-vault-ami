#! /bin/bash
# See Installation docs at https://www.vaultproject.io/docs/install/index.html

# Install Vault
curl -L -o vault.zip https://releases.hashicorp.com/vault/0.9.1/vault_0.9.1_linux_amd64.zip
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
sudo chown -R root:root /etc/vault.d
sudo chmod -R 0700 /etc/vault.d

# Install Vault as a Service
sudo mv vault.service /etc/systemd/system/vault.service
sudo chown root:root /etc/systemd/system/vault.service
sudo chmod 0700 /etc/systemd/system/vault.service

# Enable Service
sudo systemctl enable vault.service

# Add VAULT_REDIRECT_ADDR to environment
sudo mv vault-redirectaddr.sh /etc/profile.d/vault-redirectaddr.sh
sudo chmod 644 /etc/profile.d/vault-redirectaddr.sh
sudo chown root:root /etc/profile.d/vault-redirectaddr.sh
