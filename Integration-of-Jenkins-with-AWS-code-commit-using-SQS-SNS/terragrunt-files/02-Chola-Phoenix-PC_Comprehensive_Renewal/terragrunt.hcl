
terraform {

  source = "../../chola-terraform-code/"

}


include "remote_state" {

  path = find_in_parent_folders()

}


inputs = {

  aws-region = "ap-south-1" ## enter the region here 

  reponame = "phani" ## ## code commit repo name 

  aws-account-id = "143642189654" ## ## enter aws account id here 

  sns-topic-prefix = "sangers"

  sns-topic-suffix = "phani" ## ## enter sns the topic suffic 

  sqs_queue_name = "testing" ## enter the sqs queue name here 


}