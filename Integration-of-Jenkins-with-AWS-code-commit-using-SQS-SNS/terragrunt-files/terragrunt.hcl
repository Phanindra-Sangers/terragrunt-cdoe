generate "backend" {
  path      = "s3backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
    backend "s3" {
        bucket  = "chola-terraform-statefiles"
        key     = "${path_relative_to_include()}/terraform.tfstate"
        region  = "ap-south-1"
        encrypt = true
        
    }
}
EOF
}