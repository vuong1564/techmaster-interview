# Biến cho các cấu hình
variable "vpc_cidr" {
  description = "CIDR block cho VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_1" {
  description = "CIDR block cho Subnet 1"
  default     = "10.0.1.0/24"
}

variable "subnet_cidr_2" {
  description = "CIDR block cho Subnet 2"
  default     = "10.0.2.0/24"
}

variable "availability_zone_1" {
  description = "Availability Zone cho Subnet 1"
  default     = "us-east-1a"
}

variable "availability_zone_2" {
  description = "Availability Zone cho Subnet 2"
  default     = "us-east-1b"
}

variable "instance_type" {
  description = "Loại instance cho EC2"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Tên của SSH Key Pair"
  default     = "my-key"
}

variable "desired_capacity" {
  description = "Số lượng instance mong muốn trong Auto Scaling Group"
  default     = 2
}

variable "max_size" {
  description = "Số lượng instance tối đa trong Auto Scaling Group"
  default     = 4
}

variable "min_size" {
  description = "Số lượng instance tối thiểu trong Auto Scaling Group"
  default     = 1
}
