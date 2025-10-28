provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-01361d3186814b895"
  instance_type          = "t2.medium"
  key_name               = "Netflix"
  vpc_security_group_ids = ["sg-054cf71124f368820"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
