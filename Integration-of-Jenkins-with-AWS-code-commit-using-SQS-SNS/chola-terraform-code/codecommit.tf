
# ##########   creating code commit repo #############################

# resource "aws_codecommit_repository" "main" {
#   repository_name = var.reponame
#   description     = "CodeCommit repo: ${var.reponame}"
#   default_branch  = "main"
# }


################ creating code commit SNS trigger ######################## 


resource "aws_codecommit_trigger" "main" {

  
  repository_name = var.reponame

  trigger {
    name            = "notifications"
    events          = ["all"]
    destination_arn = aws_sns_topic.main.arn
  }

}


