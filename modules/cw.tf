resource "aws_cloudwatch_event_rule" "tf-stop-app" {
  name        = "stop_instances_event"
  description = "Stop instances on weekends and after office hours"

  schedule_expression = "cron(0 0 ? * MON-FRI *)"  
}