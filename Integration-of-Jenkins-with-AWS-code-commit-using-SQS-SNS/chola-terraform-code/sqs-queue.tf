########################################## creating AWS SQS queue ####################################

resource "aws_sqs_queue" "main" {
  name                      = var.sqs_queue_name
  delay_seconds             = 5
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
}

resource "aws_sqs_queue_policy" "sns" {
  queue_url = aws_sqs_queue.main.id
  policy    = data.aws_iam_policy_document.sns-sqs-policy.json
}

data "aws_iam_policy_document" "sns-sqs-policy" {
  policy_id = "arn:aws:sqs:ca-central-1:${var.aws-account-id}:testing/SQSDefaultPolicy"

  statement {
    sid    = "SubscribeToSNS"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions   = ["SQS:SendMessage"]
    resources = ["${aws_sqs_queue.main.arn}"]
    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = ["arn:aws:sns:${var.aws-region}:${var.aws-account-id}:${var.sns-topic-prefix}*${var.sns-topic-suffix}"]
    }
  }
}
