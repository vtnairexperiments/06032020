resource "aws_instance" "tomcat_server" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = "example_key"

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install httpd -y"
      "sudo chkconfig httpd on"
      "sudo "service httpd start"
    
    connection {
      type = "ssh"
      host = ${aws_instance.tomcat_server.public_ip}
      user = "ec2-user"
      private_key = file("./example.pem")
    }
  }
}

resource "aws_db_instance" "my_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "var.db_user"
  password             = "var.db_password"
  parameter_group_name = "default.mysql5.7"
}

resource "aws_security_group" "db_sg" {
  name = "db_sg"
  vpc_id = "aws_instance.my_vpc.id"

  ingress {
  from_port = 3306
  to_port = 3306
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  }
}

