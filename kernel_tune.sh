#!/bin/bash
# RUN ON EC2 HOST AS ROOT

# 1. Raise File Descriptors (Sockets)
echo "fs.file-max = 2000000" >> /etc/sysctl.conf

# 2. Raise TCP Max Connection Queue (Defeats 502 Bad Gateway under burst)
echo "net.core.somaxconn = 65535" >> /etc/sysctl.conf

# 3. Raise TCP Backlog (Prevents SYN drops)
echo "net.ipv4.tcp_max_syn_backlog = 65535" >> /etc/sysctl.conf

# 4. Enable TCP Fast Open (Speeds up repeated connections)
echo "net.ipv4.tcp_fastopen = 3" >> /etc/sysctl.conf

# 5. Local Port Range (Allows more outbound connections if needed)
echo "net.ipv4.ip_local_port_range = 1024 65535" >> /etc/sysctl.conf

# 6. Apply limits to Docker daemon
mkdir -p /etc/systemd/system/docker.service.d/
cat <<EOF > /etc/systemd/system/docker.service.d/limit.conf
[Service]
LimitNOFILE=1048576
LimitNPROC=1048576
LimitCORE=infinity
EOF

sysctl -p
systemctl daemon-reload
systemctl restart docker
