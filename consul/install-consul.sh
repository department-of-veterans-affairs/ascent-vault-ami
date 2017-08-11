#! /bin/bash
# See Installation docs at https://www.consul.io/docs/install/index.html

# Install Consul
curl -L -o consul.zip https://releases.hashicorp.com/consul/0.9.2/consul_0.9.2_linux_amd64.zip?_ga=2.41078754.1103121381.1502378566-1227330984.1502284788
unzip consul.zip
sudo mv consul /usr/bin
sudo chmod 0755 /usr/bin/consul
sudo chown -R root:root /usr/bin/consul
rm consul.zip

# Configure Consul
sudo mkdir /etc/consul.d
sudo mv ~/consul-config.json /etc/consul.d/config.json
sudo chown -R root:root /etc/consul.d
sudo chmod -R 0700 /etc/consul.d

sudo mkdir /opt/consul
sudo mkdir /opt/consul/data
sudo mkdir /opt/consul/config
sudo chown -R root:root /opt/consul
sudo chmod -R 0700 /opt/consul


