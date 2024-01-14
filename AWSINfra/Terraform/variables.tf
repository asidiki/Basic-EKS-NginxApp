#variables.tf
variable "vpc_cidr_block" {
 type = string
 description = "CIDR block for VPC"
}
variable "subnet_cidr_block" {
 type = string
 description = "CIDR block for subnet"
}
variable "availability_zone" {
 type = string
 description = "AWS availability zone"
}
variable "env_prefix" {
 type = string
 description = "Dev or Prod"
}
variable "instance_type" {
 type = string
 description = "Instance type for Ec2"
}