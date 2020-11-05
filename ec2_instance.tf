terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.13.0"
    }
  }
}

variable "region" {
  default = "eu-central-1"
}

variable "ami" {
  default = "ami-0c960b947cbb2dd16"
}

variable "instance_type" {
  default = "t2.micro"
}

provider "aws" {
  # Configuration options
  profile = "default"
  region  = var.region
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
}