# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
    backend "s3" {
        bucket  = "terraform-statefiles-chola"
        key     = "./terraform.tfstate"
        region  = "ap-south-1"
        encrypt = true
        
    }
}
