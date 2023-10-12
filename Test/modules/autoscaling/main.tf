#Create an Auto Scaling Group
resource "aws_autoscaling_group" "example" {
  name                      = var.autoscaling_name
  min_size                  = var.min_size 
  max_size                  = var.max_size 
  desired_capacity          = var.desired_capacity 
  launch_template {
    id = var.launch_id_name
  }
  vpc_zone_identifier        = var.vpc_zone_identifier # Replace with your subnet IDs
  #target_group_arns         = [aws_lb_target_group.example.arn] # If you're using an ALB
  #termination_policies      = ["Default"]
  #health_check_type         = "EC2"
  #health_check_grace_period = 300
  #enabled_metrics           = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity"]
}
