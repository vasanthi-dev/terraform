resource "aws_spot_instance_request" "instance" {
  count         = length(var.components)
  ami           = "data.aws_ami.ami.id"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0b088a90c7082b15c"]
  wait_for_fulfillment = true

  tags = {
    Name = element(var.components, count.index)
  }
}
resource "aws_ec2_tag" "tags" {
  resource_id = element(aws_spot_instance_request.instance.*.spot_instance_id, count.index )
  key         = "Name"
  value       = element(var.components, count.index)
}

data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "^Centos*"
  owners           = ["973714476881"]
}
variable "components" {
  default = ["frontend", "mongodb", "catalogue","cart", "user", "redis", "mysql", "shipping", "rabbitmq","payment"]
}

provider "aws" {
  region = "us-east-1"
}