#!bin/bash
sudo apt update -y
sudo apt install docker -y
sudo apt install git -y
sudo apt install jq -y 
sudo usermod -a -G docker ubuntu
sudo systemctl start docker
sudo systemctl enable docker
export RUNNER_ALLOW_RUNASROOT=true
mkdir /home/ubuntu/actions-runner/
cd /home/ubuntu/actions-runner
sudo wget https://github.com/actions/runner/releases/download/v2.307.0/actions-runner-linux-x64-2.307.0.tar.gz
sudo echo "2974243bab2a282349ac833475d241d5273605d3628f0685bd07fb5530f9bb1a  actions-runner-linux-x64-2.309.0.tar.gz" | shasum -a 256 -c -P /home/ubuntu/actions-runner
sudo tar xzf ./actions-runner-linux-x64-2.307.0.tar.gz
sudo chown ubuntu:ubuntu /home/ubuntu/actions-runner/*
PAT=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
token=$(curl -s -XPOST -H "authorization: token $PAT" "https://github.com/technical-stuff/githuactions_testing/actions/runners/registration-token" | jq -r .token)
#token=$(curl -s -XPOST -H "authorization: token $PAT" https://github.com/technical-stuff/githuactions_testing/actions/runners/registration-token)
./config.sh --url https://github.com/technical-stuff/githuactions_testing --token A7XF7R3QT7NQTYFKQSICRQ3FFZKH6 --name "my-runner-$(hostname)" --work _work
sudo ./svc.sh install
sudo ./svc.sh start
# #!/bin/bash
# sudo apt-get update
# sudo apt-get install -y git
# mkdir /home/ubuntu/actions-runner/
# sudo chown ubuntu:ubuntu /home/ubuntu/actions-runner/*   
# cd /home/ubuntu/actions-runner
# sudo wget https://github.com/actions/runner/releases/download/v2.309.0/actions-runner-linux-x64-2.309.0.tar.gz
# sudo echo "2974243bab2a282349ac833475d241d5273605d3628f0685bd07fb5530f9bb1a  actions-runner-linux-x64-2.309.0.tar.gz" | shasum -a 256 -c -P /home/ubuntu/actions-runner
# sudo tar xzf actions-runner-linux-x64-2.309.0.tar.gz
# sudo ./config.sh --url https://github.com/technical-stuff/githuactions_testing --token A7XF7R4FDLGLNCMF72PC2WLFFD7KC
# ./run.sh
# sudo ./svc.sh install
# sudo ./svc.sh start
# sudo ./svc.sh status

