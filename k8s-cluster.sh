#!/usr/bin/env bash

function create_cluster() {
  # create master first
  vagrant up k8s-master-0
  # create worker nodes
  vagrant up k8s-worker-{0,1}
}

function delete_cluster() {
  vagrant destroy -f
}

if [[ "$1" == "create" ]]; then create_cluster; fi
if [[ "$1" == "delete" ]]; then delete_cluster; fi
