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
  user_data = "${file("userdata_script.sh")}"
}
