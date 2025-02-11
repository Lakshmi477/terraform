# define an input varibales to EC2 instances
variable "instance_type" {
    description = "EC2 instance type"
    type = string
    default = "t2.micro"
  
}
# define an input varibales to EC2 instances for AMI id
variable "ami_id" {
    description = "EC2 instance AMi id"
    type = string
  
}
#configure the AWS provider using input variables
provider "aws" {
    region = "us-east-1"
  
}
#create EC2 instance using input varibales
resource "aws_instance" "example_instance" {
    ami = var.ami_id
    instance_type = var.instance_type
  
}
# define output variables to expose publc IP
output "publc_ip" {
    description = "Public IP of the EC2"
  value = aws_instance.example_instance.public_ip
}

