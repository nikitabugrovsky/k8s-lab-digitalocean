# 
K8S Lab: 3 nodes setup: k8s-master + 2 worker nodes in Vagrant (Centos 7 box).

# Requirements

1. Supported Host OS:
  - Linux
  - MacOS
  - Windows

2. Vagrant >= 2.2.5([Vagrant Installation Guide](https://www.vagrantup.com/docs/installation/))
3. Vagrant plugins:
  - vagrant-hosts (``` vagrant plugin install vagrant-hosts ```)
  - vagrant-cachier (``` vagrant plugin install vagrant-cachier ```)
4. VirtualBox >= 6.0.10 ([Virtual Box Download](https://www.virtualbox.org/wiki/Downloads))
5. Ansible >= 2.8.2 ([Ansible Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html))
6. Supported Guest OS: centos/7 box (``` vagrant box add centos/7 ```)

# How to Start K8S Lab

```bash
vagrant up
```

# Inspired by official Kubernetes docs
https://kubernetes.io/blog/2019/03/15/kubernetes-setup-using-ansible-and-vagrant/
