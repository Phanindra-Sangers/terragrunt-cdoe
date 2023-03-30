
terraform {

  source = "../../chola-terraform-code/"

}


include "remote_state" {

  path = find_in_parent_folders()

}


inputs = {


  aws-region = "ap-south-1" ## enter the region here 

  reponame = "test-repo2" ## ## code commit repo name 

  aws-account-id = "437097720063" ## ## enter aws account id here 

  sns-topic-prefix = "testing-"

  sns-topic-suffix = "-testchola" ## ## enter sns the topic suffic 

  sqs_queue_name = "testing-queue" ## enter the sqs queue name here 


}


## sns naming convention == name         = "${var.sns-topic-prefix}${var.reponame}${var.sns-topic-suffix}"