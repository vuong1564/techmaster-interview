> Cấu hình Terraform Remote State để lưu trữ trạng thái trên S3 bucket​

    Terraform Remote State cho phép lưu trữ trạng thái (state) của Terraform trên các backend từ xa, như S3 bucket trên AWS. Điều này giúp làm việc nhóm dễ dàng hơn và tránh xung đột khi nhiều người cùng làm việc trên cùng một dự án.
# 1. Tạo S3 Bucket và DynamoDB Table
Chạy các lệnh Terraform trong thư mục dự án
```shell
terraform init
terraform apply
```
Sau khi thực hiện, sẽ có một S3 bucket và một DynamoDB table sẵn sàng để sử dụng.
# 2. Cấu hình Terraform Remote State
Thêm file backend.tf vào trong repo Terraform
# 3. Khởi tạo Terraform với Remote State
Sau khi đã cấu hình backend, cần chạy lệnh terraform init để Terraform nhận biết cấu hình remote state:
```shell
terraform init
```
Terraform sẽ di chuyển trạng thái cục bộ (nếu có) lên S3 và bắt đầu sử dụng trạng thái từ xa.
# 4. Kiểm tra Remote State
Sau khi khởi tạo, có thể kiểm tra trạng thái Terraform đã được lưu trữ trên S3 bucket và khóa trạng thái (state locking) hoạt động thông qua DynamoDB table.
