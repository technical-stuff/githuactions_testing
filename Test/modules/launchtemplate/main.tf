resource "aws_launch_template" "example" {
  name_prefix                   = var.launch_template_name
  description                   = var.launch_template_description
  image_id                      = var.ami_id
  instance_type                 = var.instance_type
  #key_name                      = var.key_name
  vpc_security_group_ids        = [var.vpc_security_group_ids]
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 8
      volume_type = "gp2"
    }
  }
  user_data = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y git
    mkdir /home/ubuntu/actions-runner
    wget https://github.com/actions/runner/releases/download/v2.278.1/actions-runner-linux-x64-2.278.1.tar.gz -P /home/ubuntu/actions-runner
    tar xzf /home/ubuntu/actions-runner/actions-runner-linux-x64-2.278.1.tar.gz
    cd /home/ubuntu/actions-runner
    ./config.sh --url https://github.com/technical-stuff/githuactions_testing --token A7XF7R4FDLGLNCMF72PC2WLFFD7KC
    ./svc.sh install
    ./svc.sh start
  EOF
}