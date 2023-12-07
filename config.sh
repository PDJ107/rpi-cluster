#!/usr/bin/env bash

# vim configuration
sudo sh -c 'echo 'alias vi=vim' >> /etc/profile'

# disable and uninstall swap
# swapoff -a
# sudo sed -i.bak -r 's/(.+ swap .+)/#\1/' /etc/fstab
sudo dphys-swapfile swapoff
sudo dphys-swapfile uninstall
sudo apt purge -y dphys-swapfile
sudo apt autoremove -y

# config network
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward = 1
EOF
sudo modprobe br_netfilter

sudo sh -c 'echo "192.168.10.11 rpi-1" >> /etc/hosts'
for (( i=2; i<=$1; i++ )); do sudo sh -c "echo '192.168.10.1$i rpi-$i' >> /etc/hosts"; done

# add cgroup flags
echo " cgroup_enable=cpuset cgroup_enable=memory cgroup_memory=1" | sudo tee -a  /boot/cmdline.txt # raspbian
# echo " cgroup_enable=cpuset cgroup_enable=memory cgroup_memory=1" | sudo tee -a  /boot/firmware/cmdline.txt # ubuntu