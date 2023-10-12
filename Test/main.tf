#launch_template
module "ec2_template" {
    source      = "./modules/launchtemplate"
    launch_template_name = var.launch_template_name
    launch_template_description = var.launch_template_description
    ami_id = var.ami_id
    instance_type = var.instance_type
#    key_name = var.key_name
    vpc_security_group_ids = var.vpc_security_group_ids
}

#autoscaling_group
module "autoscaling_group" {
    source = "./modules/autoscaling"
    autoscaling_name = var.autoscaling_name
    min_size = var.min_size
    max_size = var.max_size
    desired_capacity = var.desired_capacity
    launch_id_name = module.ec2_template.launch_template_id
    vpc_zone_identifier = [var.vpc_zone_identifier]
}