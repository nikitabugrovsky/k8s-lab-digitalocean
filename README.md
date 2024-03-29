# K8S Lab: 3 nodes setup: k8s-master + 2 worker nodes on Digital Ocean (centos 7).

# Requirements

1. [Digital Ocean Account with Personal Access Token (read & write permissions)](https://www.digitalocean.com/docs/api/create-personal-access-token/)
2. Supported Host OS:
  - Linux
  - MacOS

3. Vagrant >= 2.2.5([Vagrant Installation Guide](https://www.vagrantup.com/docs/installation/))
4. Vagrant plugins:
  - vagrant-digitalocean (``` vagrant plugin install vagrant-digitalocean ```)
5. Ansible >= 2.8.2 ([Ansible Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html))
6. Supported Guest OS: digital_ocean (``` vagrant box add  digital_ocean ```)

# How to Create K8S Lab

```bash
DO_API_KEY=<your token>
./k8s-cluster.sh create
```

# How to Destroy K8S Lab

```bash
DO_API_KEY=<your token>
./k8s-cluster.sh delete
```

# Inspired by
- [Digital Ocean Docs](https://www.digitalocean.com/community/tutorials/how-to-create-a-kubernetes-cluster-using-kubeadm-on-debian-9)
- [K8S DOCS](https://kubernetes.io/blog/2019/03/15/kubernetes-setup-using-ansible-and-vagrant/)
