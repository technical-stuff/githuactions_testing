#launch_template
launch_template_name        = "my-launch-template-"
launch_template_description = "custom aws_launch_template"
instance_type               = "t2.micro"
#key_name                    = "gitkeyname"
ami_id                      = "ami-027c3d0c162f3387b"
vpc_security_group_ids      = "sg-073744a647fcc8042"


autoscaling_name = "example-auto-scaling-group"
min_size = 1
max_size = 1
desired_capacity = 1
vpc_zone_identifier = "subnet-00146fe97b752d38b"