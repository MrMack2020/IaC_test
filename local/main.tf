terraform{
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.48"
    }
  }

  required_version = ">= 0.15.0"
}

resource "aws_key_pair" "sample_key" {
  key_name   = "sample-key"
  public_key = var.sample_public_key

  tags = {
    "Name" = "sample_public_key"
  }
}

resource "aws_instance" "sample_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.sample_key.key_name

  tags = {
    "Name" = "sample_server"
  }
}

