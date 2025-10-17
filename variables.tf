variable "ami_id" {
    default = "ami-0341d95f75f311023"
}

variable "instance_type" {
    default = "t2.large"
}

variable "ec2_tags" {
    type = map
    default = {    
    Name = "Terraform-broken"
    Terraform = "true"
    Project = "naming the ec2 tags for now"

    
    }

}

variable "sg_name" {
    type = string
    default = "allow-all"
    #optional to write the description
    description = "this is declared for security group"
}

variable "cidr" {
    type = list 
    default = ["0.0.0.0/0"]
}

variable "egress_from_port" {
    default = 0
}

variable "egress_to_port" {
    default = 0    
 }

variable "ingress_from_port" {
    default = 0
}

variable "ingress_to_port" {
    default = 0    
 }

 variable "protocol"{
    default = "-1"
 }