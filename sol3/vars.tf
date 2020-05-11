variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "AMIS_FREE_TIER" {
  default = "ami-0dad359ff462124ca"
  description = "ubuntu server 20.04: free tier"
}

variable "AMIS" {
  default = {
    eu-west-1      = "ami-0dad359ff462124ca"
    ap-northeast-2 = "ami-00edfb46b107f643c"
    us-east-1      = "ami-085925f297f89fce1"
  }
}

variable "INSTANCES_MICRO" {
  default = "t2.micro"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

variable "PATH_TO_PUBLIC_KEY" {
    default = "~/.ssh/id_rsa.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
    default = "~/.ssh/id_rsa"
}

variable "VERSION" {
    default = "0.1"
}

variable "WEB_SERVER_COUNT" {
    default = "3"
}

variable "DB_SERVER_COUNT" {
    default = "1"
}

variable "PUBLIC_SUBNET_NUMBERS" {
    default = "3"
}

variable "PRIVATE_SUBNET_NUMBERS" {
    default = "1"
}
