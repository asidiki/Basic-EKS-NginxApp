data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "myjenkins-server" {
  ami                         = data.aws_ami.latest-amazon-linux-image.id
  instance_type               = var.instance_type
  key_name                    = "nginxapp"
  subnet_id                   = aws_subnet.public_subnet[0].id
  vpc_security_group_ids      = [aws_security_group.default.id]
  associate_public_ip_address = true
  user_data                   = "${file("jenkins-setup.sh")}"
  tags = {
    Name = "${var.environment}-server"
  }
}

output "ec2_public_ip" {
  value = aws_instance.myjenkins-server.public_ip
}