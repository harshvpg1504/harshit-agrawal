terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.19.0"
    }
  }
}

provider "aws" {
}
resource "aws_instance" "dev" {
  ami           = "ami-0729e439b6769d6ab"
  instance_type = var.insttype == 1 ? "t2.nano" : " t2.micro"
  count = var.whatenv == "dev" ? 1 : 0
}

resource "aws_instance" "prod" {
  ami           = "ami-0729e439b6769d6ab"
  instance_type = var.insttype == 1 ? "t2.nano" : " t2.micro"
  count = var.whatenv == "prod" ? 2 : 0
}

variable "whatenv" {
default = "prod"
}

variable "insttype" {
 default = 2
}
