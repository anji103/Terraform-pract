resource "aws_instance" "ec2_example" {

    ami = "ami-0f918f7e67a3323f0"  
    instance_type = "t2.micro" 
    key_name= "aws_key"
    vpc_security_group_ids = [aws_security_group.main.id]

  provisioner "file" {
    source      = "/home/rahul/Jhooq/keys/aws/test-file.txt"
    destination = "/home/ubuntu/test-file.txt"
  }
  connection {
		type        = "ssh"
		host        = self.public_ip
		user        = "ubuntu"
		private_key = file("C:\\Users\\anjis\\.ssh\\id_rsa")
		timeout     = "4m"
	}
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFbRP5eComvyMwvJnJT73KEzu4I5Fv32dHce1tYUkL2vt3pEd03jjqd0ktuyW1bQkbwTebhTl57BnZlp85ZMD9WkP1F1IcB8RS8v3WXYgJNqtZsKnzHNdFeImXDGRZJNYJq/VLUcHYR4Pvz+3uJVplcZVMuQKy3DAinDbtssGd1biZlpr44/CKAqqXtgPN3r/1bWUS25P7Tq4MoxWO0Lv8t57MIr3eb5kUgv/p0nrZSokxRK9nJ6Dvxdf92PaJEa4E/LlGfdUv7KvwHYB9/HntJze5Fy28H7E112U0A8LkoYxMl4tmRSJ9PAqiRkGJ4Bnbp00pyyzY9BeB9NlBWbyL"
}

