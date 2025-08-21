variable "sg_name" {
  description = "Name of the security group"
  type        = string
  default     = "my-security-group"
}

variable "sg_description" {
  description = "Description of the security group"
  type        = string
  default     = "Allow SSH"
}

variable "ssh_port" {
  description = "SSH port to allow (ingress)"
  type        = number
  default     = 22
}

variable "ingress_protocol" {
  description = "Protocol for ingress"
  type        = string
  default     = "tcp"
}

variable "allowed_cidr" {
  description = "CIDR blocks allowed for ingress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_from_port" {
  description = "Egress rule from_port"
  type        = number
  default     = 0
}

variable "egress_to_port" {
  description = "Egress rule to_port"
  type        = number
  default     = 0
}

variable "egress_protocol" {
  description = "Egress rule protocol"
  type        = string
  default     = "-1" # all traffic
}

variable "egress_cidr_blocks" {
  description = "CIDR blocks for egress traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "sg_tag_name" {
  description = "Tag name for the security group"
  type        = string
  default     = "mysg"
}

variable "myinstype" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the EC2 key pair"
  type        = string
  default     = "eks"
}

variable "myaz" {
  description = "Availability zone for EC2 instance"
  type        = string
  default     = "ap-south-1a"
}
variable "sg"{
  type = list(string)
  default = ["sg-0bcf2b40819d8e19b"]
}
