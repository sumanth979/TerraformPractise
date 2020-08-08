#Fetch Access Key and Secret Key details
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
  access_key = "${var.AWS_ACCESS_KEY}"
  secret_key = "${var.AWS_SECRET_KEY}"
}

# Creating a Key Pair to launch instance - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair
resource "aws_key_pair" "ec2_key_pair" {
  key_name = "ec2_key_pair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfgJcOHwbFj7m/5Q+t+FIk/SVbLf/lR4yE6fnWbQXN+x/xbxeSQUaLgxCOEVx7Al5iXg/jjk7TvTxpC9f0LJlg3+5QfCqDbaWxo+2UO3AccqTvKJwAshY6dWJk3e8PA7GAzRVIGm6xe41HfRJoQ+MGRAX4bmaheGr5ThGql29k6gzp08p5Y0bi+1KkkA/3QyntfM5oGb1fMA5nQcO5n0I3tVrVdjfpnuAumcgOUxXv2yPDCF/mo6E2Gz7rwtftkpNbA234AtfqU8PZs1zLHxOs8TgqfRXl4AG5+RmoqkgQtmQtKUly93vEAJkie9T01dfZp1tWgP2hrw8rJuSIr+bH skanagal@MAA-SKANAGAL-M"
  
}
# Creating Security groups - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "allow_http_ssh" {
  name        = "allow_http_ssh"
  description = "Allow http and ssh inbound traffic"

  ingress {
    description = "Allow HTTP inbound traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH inbound traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create and Launch an EC2 instance - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "my_first_instance" {
  ami = "ami-09d8b5222f2b93bf0"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.allow_http_ssh.name}"]
  key_name = "${aws_key_pair.ec2_key_pair.key_name}"
  user_data = "${file("./userData.sh")}"

  tags = {
    Name = "MyFirstInstance"
  }
}

# output the public IP Address of the EC2 machine created.
output "Public_IP" {
  value = "${aws_instance.my_first_instance.public_ip}"
}