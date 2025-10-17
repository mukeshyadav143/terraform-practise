resource "aws_instance" "terraform" {
  ami = var.ami_id
  instance_type = var.environment == "dev" ? "t3.large" : "t3.medium"
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name      = "normal-server"
    Terraform = "true"
  }
}

resource "aws_security_group" "allow_all" {
  name        = "not-changable"
  description = "Allow all inbound traffic"
  vpc_id      = "vpc-0e4e8e7d7eEXAMPLE"

  ingress {
    description = "Allow all inbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["10.1.0.0/18"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  }
}