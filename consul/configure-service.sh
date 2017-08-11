# Install Consul as a Service
sudo mv consul.service /etc/systemd/system/consul.service
sudo chown root:root /etc/systemd/system/consul.service
sudo chmod 0700 /etc/systemd/system/consul.service

# Enable Service
sudo systemctl enable consul.service