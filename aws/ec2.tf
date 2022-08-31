resource "aws_default_vpc" "new-default-vpc" {
  tags = {
    Name = "New Default VPC"
  }
}

resource "aws_instance" "webserver" {
    ami = "ami-05fa00d4c63e32376"
    instance_type = "t2.micro"
    tags = {
        Name = "My webserver"
        Description = "An terraform made web server"
    }
    user_data = <<-EOF
                #!/bin/bash
                sudo apt update
                sudo apt install nginx -y
                systemctl enable nginx
                systemctl start nginx
                EOF
    #key_name = aws_key_pair.my-key.id
    vpc_security_group_ids = [ aws_security_group.new-sg.id ]
    provisioner "local-exec" {
      on_failure = continue
      command = "echo Instance ${aws_instance.webserver.public_ip} Created! > location.txt"
    }
}

#resource "aws_key_pair" "my-key" {
  #public_key = ""
#}

resource "aws_security_group" "new-sg" {
  name = "new-sg"
  description = "Allow SSH access from internet"
  vpc_id = aws_default_vpc.new-default-vpc.id
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output publicip {
    value = aws_instance.webserver.public_ip 
}
