#!/usr/bin/env bash

K8S_CLUSTER_ADMIN="k8s_admin"

function k8s_master_ip() {
  vagrant ssh-config k8s-master-0 | awk '/([0-9]{1,3}\.?){4}/{ print $2 }'
}

K8S_MASTER_IP="$(k8s_master_ip)"

function label_workers() {
  ansible-playbook -u "${K8S_CLUSTER_ADMIN}" -i "${K8S_MASTER_IP}", --ssh-extra-args='-o StrictHostKeyChecking=no' k8s-tasks/labels.yml
}

function create_cluster() {
  # create master first
  vagrant up k8s-master-0
  # create worker nodes
  vagrant up k8s-worker-{0,1}
  # label worker nodes
  label_workers
}

function delete_cluster() {
  vagrant destroy -f
}

if [[ "$1" == "create" ]]; then create_cluster; fi
if [[ "$1" == "delete" ]]; then delete_cluster; fi
