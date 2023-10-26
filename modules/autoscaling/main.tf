

resource "aws_autoscaling_group" "autoscaling_group_test2" {
    name = var.name
    vpc_zone_identifier = var.vpc_zone_identifier
    launch_configuration = var.launch_configuration
    max_size = var.max_size
    min_size = var.min_size
    health_check_grace_period = 300
    health_check_type         = "EC2"
    force_delete              = true
    target_group_arns         = var.target_group_arns

    tag {
      key = "Name"
      value = "ec2 instance"
      propagate_at_launch = true
    } 
}

resource "aws_autoscaling_policy" "cpu_policy_autocaling" {
    name = "cpu_policy_autocaling"
    autoscaling_group_name  = aws_autoscaling_group.autoscaling_group_test2.name
     adjustment_type        = "ChangeInCapacity"
     scaling_adjustment     = "1"
     cooldown               = 300
     policy_type            = "SimpleScaling"
  
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
    alarm_name                = "cpu-alarm-test2"
    alarm_description         = "This metric monitors ec2 cpu utilization"
    comparison_operator       = "GreaterThanOrEqualToThreshold"
    evaluation_periods        = 2
    metric_name               = "CPUUtilization"
    namespace                 = "AWS/EC2"
    period                    = 120
    statistic                 = "Average"
    threshold                 = 80

    dimensions = {
      "AutoScalingGroupName" = aws_autoscaling_group.autoscaling_group_test2.name
    }
    actions_enabled = true
    alarm_actions = [aws_autoscaling_policy.cpu_policy_autocaling.arn]
}
  
