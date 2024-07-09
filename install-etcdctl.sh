#!/bin/bash

etcd_pod=$(kubectl get pods --all-namespaces | grep etcd | awk '{print $2}')
etcd_namespace=$(kubectl get pods --all-namespaces | grep etcd | awk '{print $1}')

etcd_image=$(kubectl get pod $etcd_pod -n $etcd_namespace -o jsonpath='{.spec.containers[0].image}')


etcd_version=$(echo $etcd_image | grep -oP '(?<=:v)[0-9]+\.[0-9]+\.[0-9]+')


echo "v$etcd_version"


ETCD_VERSION="v${etcd_version}"

curl -L https://github.com/coreos/etcd/releases/download/$ETCD_VERSION/etcd-$ETCD_VERSION-linux-amd64.tar.gz -o etcd-$ETCD_VERSION-linux-amd64.tar.gz

tar xzvf etcd-$ETCD_VERSION-linux-amd64.tar.gz
rm etcd-$ETCD_VERSION-linux-amd64.tar.gz

cd etcd-$ETCD_VERSION-linux-amd64
sudo cp etcd /usr/local/bin/
sudo cp etcdctl /usr/local/bin/

rm -rf etcd-$ETCD_VERSION-linux-amd64

etcdctl version
