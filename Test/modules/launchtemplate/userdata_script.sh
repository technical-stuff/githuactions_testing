#!/bin/bash
sudo apt-get update
sudo apt-get install -y git
mkdir /home/ubuntu/actions-runner
wget https://github.com/actions/runner/releases/download/v2.278.1/actions-runner-linux-x64-2.278.1.tar.gz -P /home/ubuntu/actions-runner
tar xzf /home/ubuntu/actions-runner/actions-runner-linux-x64-2.278.1.tar.gz
cd /home/ubuntu/actions-runner
sudo ./config.sh --url https://github.com/technical-stuff/githuactions_testing --token A7XF7R4FDLGLNCMF72PC2WLFFD7KC
sudo ./svc.sh install
sudo ./svc.sh start
