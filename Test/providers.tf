provider "aws" {
  region = "us-east-1"
}

#backend for development_team
terraform {
    backend "s3" {
        bucket          = "githubactions123"
        key             = "githubactions.tfstate"
        region          = "us-east-1"
        dynamodb_table  = "gitgubactions"      
    }
}


