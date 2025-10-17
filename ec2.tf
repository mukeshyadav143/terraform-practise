# below code will create a EC2 isntance named terraform
resource "aws_instance" "terraform" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.newly-created-group.id]

  tags = {
    Name      = "normal-server"
    Terraform = "true"
  }
}

# Below code will creae the security group named ALLOWING-ALL-GROUPS
resource "aws_security_group" "newly-created-group" {
  name = "Non-changable-SG-NAme"

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr 
  }

  ingress {
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr
  }

  tags = {
    Name = "new-SG naming convention"
  }
}
