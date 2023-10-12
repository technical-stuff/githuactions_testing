variable "launch_template_name" {}
variable "launch_template_description" {}
variable "ami_id" {}
variable "instance_type" {}
#variable "key_name" {}
variable "vpc_security_group_ids" {}


variable "autoscaling_name" {}
variable "min_size" {}
variable "max_size" {}
variable "desired_capacity" {}
variable "vpc_zone_identifier" {}