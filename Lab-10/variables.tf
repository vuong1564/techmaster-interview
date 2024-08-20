variable "vpc_cidr" {
  description = "CIDR block cho VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block cho Subnet"
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability Zone cho Subnet"
  default     = "us-east-1a"
}
