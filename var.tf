variable "ami_id" {
  type        = string
  description = "AMI ID"
  default     = "ami-0b0dcb5067f052a63"

}
variable "instance_type" {
  type    = string
  default = "t2.micro"

}
