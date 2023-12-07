sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg  https://dl.k8s.io/apt/doc/apt-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update

# find versions
# sudo apt-cache madison kubectl | awk '{ print $3 }'

Ver=1.18.4-01
sudo apt install kubectl=$Ver kubelet=$Ver kubeadm=$Ver -y
sudo apt-mark hold kubelet kubeadm kubectl