resource "aws_s3_bucket" "artifact_bucket" {
  bucket = "my-artifact-bucket"
}

resource "aws_launch_configuration" "app_lc" {
  name_prefix   = "app-lc-"
  image_id      = "ami-0abcdef1234567890"
  instance_type = "t2.micro"
  key_name      = "your-key-pair"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "app_asg" {
  desired_capacity     = 2
  max_size            = 3
  min_size            = 1
  launch_configuration = aws_launch_configuration.app_lc.id
  vpc_zone_identifier = ["subnet-12345678"]
}

resource "aws_lb" "app_lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = ["subnet-12345678"]
}

resource "aws_cloudwatch_log_group" "app_log_group" {
  name = "/ecs/app-logs"
}
