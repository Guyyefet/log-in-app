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

resource "aws_db_instance" "my-first-db" {
  allocated_storage    = 10
  engine               = "PostgreSQL"
  instance_class       = "db.t3.micro"
  db_name              = "my-first-db"
}

resource "aws_instance" "example2" {
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
    tags = {
    Name = "terraform-example2"
  }
}

