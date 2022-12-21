# Resource: aws_vpc
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "main" {
  # The CIDR block for the VPC.
  cidr_block = "192.168.0.0/16"

  # Makes your instances shared on the host.
  instance_tenancy = "default"

  # Required for EKS. Enable/disable DNS support in the VPC.
  enable_dns_support = true

  # Required for EKS. Enable/disable DNS hostnames in the VPC.
  enable_dns_hostnames = true

  # Enable/disable ClassicLink for the VPC.
  enable_classiclink = false

  # Enable/disable ClassicLink DNS Support for the VPC.
  enable_classiclink_dns_support = false

  # Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC.
  assign_generated_ipv6_cidr_block = false

  # A map of tags to assign to the resource.

  tags = {
    Name = "Main VPC"
  }
}

# # Public Subnet with Default Route to Internet Gateway
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
# resource "aws_subnet" "public" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = "10.0.0.0/24"

#   tags = {
#     Name = "Public Subnet"
#   }
# }

# # Private Subnet with Default Route to NAT Gateway
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
# resource "aws_subnet" "private" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = "10.0.1.0/24"

#   tags = {
#     Name = "Private Subnet"
#   }
# }

# # Main Internal Gateway for VPC
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.main.id

#   tags = {
#     Name = "Main IGW"
#   }
# }

# # Elastic IP for NAT Gateway
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
# resource "aws_eip" "nat_eip" {
#   vpc        = true
#   depends_on = [aws_internet_gateway.igw]
#   tags = {
#     Name = "NAT Gateway EIP"
#   }
# }

# # Main NAT Gateway for VPC
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway
# resource "aws_nat_gateway" "nat" {
#   allocation_id = aws_eip.nat_eip.id
#   subnet_id     = aws_subnet.public.id

#   tags = {
#     Name = "Main NAT Gateway"
#   }
# }

# # Route Table for Public Subnet
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }

#   tags = {
#     Name = "Public Route Table"
#   }
# }

# # Association between Public Subnet and Public Route Table
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
# resource "aws_route_table_association" "public" {
#   subnet_id      = aws_subnet.public.id
#   route_table_id = aws_route_table.public.id
# }

# # Route Table for Private Subnet
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
# resource "aws_route_table" "private" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.nat.id
#   }

#   tags = {
#     Name = "Private Route Table"
#   }
# }

# # Association between Private Subnet and Private Route Table
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
# resource "aws_route_table_association" "private" {
#   subnet_id      = aws_subnet.private.id
#   route_table_id = aws_route_table.private.id
# }

