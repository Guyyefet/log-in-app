# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 3.0"
#     }
#   }
# }

provider "aws" {
  # access_key = AKIASUYKOXW32OS57UZ7R
  # secret_key = M5sGQHD1OWnqtMfy5ZYiea8nQXAsa + v51L0z6pxJ
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
    tags = {
    Name = "terraform-example"
  }
}

# resource "aws_s3_bucket" "my-first-s3-bucket" {
#   bucket = "my-tf-test-bucket"
#     tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }

# resource "aws_db_instance" "my-first-db" {
#   allocated_storage    = 10
#   engine               = "PostgreSQL"
#   instance_class       = "db.t3.micro"
#   db_name              = "my-first-db"
# }

