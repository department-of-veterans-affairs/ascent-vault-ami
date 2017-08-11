# Configure Consul
sudo mkdir /etc/consul.d
sudo mv ~/consul-server-config.json /etc/consul.d/server.json
sudo chown -R root:root /etc/consul.d
sudo chmod -R 0700 /etc/consul.d

sudo mkdir /opt/consul
sudo mkdir /opt/consul/data
sudo mkdir /opt/consul/config
sudo chown -R root:root /opt/consul
sudo chmod -R 0700 /opt/consul