# Using the us-east-1 region for CodeCommit
variable "reponame" {

  type    = string
  default = "minfy-repo"

}
variable "aws-account-id" {

  type = string

  default = "143642189654"
}

variable "aws-region" {

  type  = string

  default = "ap-south-1"
}


variable "sns-topic-prefix" { 

  type =  string

  default = "codecommit-" 
  
  }
variable "sns-topic-suffix" {

   type = string

   default = "-topic"
   
 }
 

 variable "sqs_queue_name" {
   
   type  = string 

   default  = "enter the queue name "
 }









