#!/bin/bash
sudo apt-get update
sudo apt-get install -y git
mkdir /home/ubuntu/actions-runner
curl -o actions-runner-linux-x64-2.309.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.309.0/actions-runner-linux-x64-2.309.0.tar.gz -P /home/ubuntu/actions-runner
echo "2974243bab2a282349ac833475d241d5273605d3628f0685bd07fb5530f9bb1a  actions-runner-linux-x64-2.309.0.tar.gz" | shasum -a 256 -c -P /home/ubuntu/actions-runner
tar xzf /home/ubuntu/actions-runner/actions-runner-linux-x64-2.278.1.tar.gz
cd /home/ubuntu/actions-runner
sudo ./config.sh --url https://github.com/technical-stuff/githuactions_testing --token A7XF7R4FDLGLNCMF72PC2WLFFD7KC
sudo ./svc.sh install
sudo ./svc.sh start
