sudo install -m 0755 -d /etc/apt/keyrings
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg # ubuntu
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
#   $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
#   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null # ubuntu
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null # raspbian
sudo apt-get update

# find versions
# sudo apt-cache madison docker-ce | awk '{ print $3 }'

# install docker
#Ver=5:19.03.15~3-0~ubuntu-focal
Ver=5:23.0.6-1~debian.12~bookworm
sudo apt-get install docker-ce=$Ver docker-ce-cli=$Ver containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo usermod -aG docker ${USER}

# cgroup 확인
# sudo docker info | grep -i cgroup

# cgroup 변경
# sudo mkdir -p /etc/docker
# cat <<EOF | sudo tee /etc/docker/daemon.json
# {
#   "exec-opts": ["native.cgroupdriver=systemd"],
#   "log-driver": "json-file",
#   "log-opts": {
#     "max-size": "100m"
#   },
#   "storage-driver": "overlay2"
# }
# EOF
# sudo systemctl enable docker
# sudo systemctl daemon-reload
# sudo systemctl restart docker