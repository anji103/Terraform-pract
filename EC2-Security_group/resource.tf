# Security Group Resource
resource "aws_security_group" "mysg" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = var.ingress_protocol
    cidr_blocks = var.allowed_cidr
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
  }

  tags = {
    Name = var.sg_tag_name
  }
}

# EC2 Instance Resource
resource "aws_instance" "myinstance" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.myinstype
  key_name               = var.key_name
  availability_zone      = var.myaz
  vpc_security_group_ids = var.sg  # Attach security group to EC2

  tags = {
    Name = "My EC2 Instance"
  }
}
