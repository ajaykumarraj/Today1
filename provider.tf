provider "aws" {
  region     = "us-east-2"
  access_key = "AKIAQREPKOTF5WJ6IYFK"
  secret_key = "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"
}

data "aws_ami" "myami" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "this" {
  ami                       = data.aws_ami.myami.id
  instance_type             = "t2.micro"
}
