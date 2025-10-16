# below code will create a EC2 isntance named terraform
resource "aws_instance" "terraform" {
  ami           = "ami-0341d95f75f311023"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-all-new.id]

  tags = {
    Name      = "terraform"
    Terraform = "true"
  }
}

# Below code will creae the security group named ALLOWING-ALL-GROUPS
resource "aws_security_group" "allow-all-new" {
  name = "new-group-created-by-code"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ALLOWING-ALL-GROUPS"
  }
}
