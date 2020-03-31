#!/usr/bin/env bash

wget https://rancher-dsop-dependencies.nyc3.digitaloceanspaces.com/calico-cni/calico.conf.default
wget https://rancher-dsop-dependencies.nyc3.digitaloceanspaces.com/calico-cni/install-cni.sh
wget https://rancher-dsop-dependencies.nyc3.digitaloceanspaces.com/calico-cni/calico
wget https://rancher-dsop-dependencies.nyc3.digitaloceanspaces.com/calico-cni/calico-ipam

docker build -t test .