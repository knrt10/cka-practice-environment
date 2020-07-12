#!/bin/bash

USERNAME=`id -un`
cd ~/.kube
mkdir -p keys

profile_name=$(minikube profile list -o json | jq -r '.valid | .[] | select(.Status=="Running") | .Name')

cp /Users/${USERNAME}/.minikube/ca.crt keys/
cp /Users/${USERNAME}/.minikube/profiles/$profile_name/client.crt keys/
cp /Users/${USERNAME}/.minikube/profiles/$profile_name/client.key keys/

gsed -i "s/\/Users\/${USERNAME}\/.minikube\/profiles\/minikube/.\/keys/g" config
gsed -i "s/\/Users\/${USERNAME}\/.minikube/.\/keys/g" config
