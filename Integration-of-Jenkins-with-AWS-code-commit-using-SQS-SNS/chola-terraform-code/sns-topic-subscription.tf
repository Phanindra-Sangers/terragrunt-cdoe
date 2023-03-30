
###################### creating SNS topic #######################################

resource "aws_sns_topic" "main" {
  name         = "${var.sns-topic-prefix}${var.reponame}${var.sns-topic-suffix}"
  display_name = "CodeCommit ${var.reponame} notifications"
}

resource "aws_sns_topic_policy" "main" {
  arn    = aws_sns_topic.main.arn
  policy = data.aws_iam_policy_document.sns-policy.json
}

#########################3 creating SNS topic subscription with sqs #######################################

resource "aws_sns_topic_subscription" "sqs" {
  topic_arn            = aws_sns_topic.main.arn
  endpoint             = aws_sqs_queue.main.arn
  raw_message_delivery = "true"
  protocol             = "sqs"
}


