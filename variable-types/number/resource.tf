resource "aws_instance" "ec2_example" {

   ami           = "ami-0767046d1677be5a0"
   instance_type =  "t2.micro"
   count = var.instance_count

   tags = {
           Name = "Terraform EC2"
   }
}
