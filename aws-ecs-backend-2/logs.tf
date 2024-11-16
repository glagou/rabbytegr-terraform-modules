# Set up CloudWatch group and log stream and retain logs for 30 days
resource "aws_cloudwatch_log_group" "main_app_log_group" {
  name              = "/ecs/main-app"
  retention_in_days = 14

  tags = {
    Name = "main-app-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "main_app_log_stream" {
  name           = "main-app-log-stream"
  log_group_name = aws_cloudwatch_log_group.main_app_log_group.name
}
