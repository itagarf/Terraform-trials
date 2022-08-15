#before posting on git, change the ip part from 79.97.153.158/32 to your.ip/32

resource "aws_security_group" "main" {
  name        = "new-sec-group"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow inbound HTTPS from my home computer"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["79.97.153.158/32"]
  }
  ingress {
    description = "Allow inbound HTTP from my home computer"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["79.97.153.158/32"]
  }
  ingress {
    description = "Allow inbound SSH from my home computer"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["79.97.153.158/32"]
  }

  egress {
    description = "Allow outbound HTTPS to anywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow outbound HTTP to anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow outbound DNS to anywhere"
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow outbound DNS to anywhere"
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "new-sec-group"
  }
}