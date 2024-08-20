terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "path/to/my/terraform.tfstate" # Đường dẫn lưu trữ file state trong bucket
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks" # Tên bảng DynamoDB dùng cho state locking
    encrypt        = true
  }
}
