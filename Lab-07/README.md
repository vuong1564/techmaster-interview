    Sử dụng AWS CLI để tạo một EC2 instance với cấu hình định trước.​
# 1. Cài đặt và cấu hình AWS CLI
Đảm bảo đã cài đặt và cấu hình AWS CLI trên máy tính. Nếu chưa, có thể cài đặt bằng lệnh:
```shell
pip install awscli
```
Cấu hình AWS CLI bằng lệnh:
```shell
aws configure
```
Các thông tin cần cung cấp như sau:

- AWS Access Key ID
- AWS Secret Access Key
- Region (ví dụ: us-east-1)
- Output format (ví dụ: json)
# 2. Xác định cấu hình EC2 Instance
Trước khi tạo EC2 instance, cần có các thông tin sau:

- AMI ID: Hình ảnh máy (Amazon Machine Image) mà bạn muốn sử dụng (ví dụ: ami-12345678).
- Instance Type: Loại instance (ví dụ: t2.micro).
- Key Pair: Tên của cặp khóa để truy cập instance.
- Security Group ID: ID của security group để quản lý quyền truy cập.
- Subnet ID: ID của subnet nơi instance sẽ được tạo (nếu cần thiết).
# 3. Sử dụng lệnh AWS CLI để tạo EC2 Instance
```shelll
aws ec2 run-instances \
    --image-id ami-12345678 \
    --instance-type t2.micro \
    --key-name MyKeyPair \
    --security-group-ids sg-12345678 \
    --subnet-id subnet-12345678 \
    --count 1 \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=MyInstance}]'
```
Trong đó:

- --image-id: ID của AMI.
- --instance-type: Loại instance.
- --key-name: Tên của cặp khóa để kết nối SSH.
- --security-group-ids: Danh sách các ID của security group.
- --subnet-id: ID của subnet (tuỳ chọn).
- --count: Số lượng instance cần tạo.
- --tag-specifications: Thêm thẻ (tags) cho instance (tùy chọn).
# 4. Kiểm tra trạng thái instance
Sau khi tạo, có thể kiểm tra trạng thái của instance bằng lệnh
```shell
aws ec2 describe-instances --instance-ids <InstanceID>
```
# 5. Kết nối đến EC2 Instance
Sử dụng lệnh SSH để kết nối:
```shell
ssh -i MyKeyPair.pem ec2-user@<PublicIP>
```
Với PublicIP là địa chỉ IP công khai của instance.