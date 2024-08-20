> Cấu hình S3 bucket để lưu trữ bản sao lưu của ứng dụng và thiết lập Lifecycle Policy để tự động xóa các bản sao lưu cũ sau 30 ngày
# 1. Tạo S3 Bucket
Trước tiên, cần tạo một S3 bucket. Có thể thực hiện điều này thông qua AWS CLI:
```shell
aws s3 mb s3://my-backup-bucket
```
Trong đó, my-backup-bucket là tên bucket.
# 2. Thiết lập quyền truy cập (Permissions)
Nếu bạn muốn kiểm soát quyền truy cập cho bucket, có thể sử dụng bucket policy hoặc IAM policy để giới hạn quyền truy cập vào bucket này. Ví dụ:
```shell
aws s3api put-bucket-policy --bucket my-backup-bucket --policy '{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::my-backup-bucket/*"
        }
    ]
}'
```
# 3. Thiết lập Lifecycle Policy
> Lifecycle Policy giúp bạn quản lý vòng đời của các đối tượng trong S3 bucket. Có thể sử dụng nó để tự động xóa các bản sao lưu cũ sau 30 ngày.
Tạo Lifecycle Policy như sau:
```shell
aws s3api put-bucket-lifecycle-configuration --bucket my-backup-bucket --lifecycle-configuration '{
    "Rules": [
        {
            "ID": "DeleteOldBackups",
            "Status": "Enabled",
            "Filter": {
                "Prefix": "backups/"
            },
            "Expiration": {
                "Days": 30
            }
        }
    ]
}'
```
Trong đó:
- "Prefix": "backups/": Điều này áp dụng policy cho các đối tượng nằm trong thư mục backups/. Nếu không muốn sử dụng thư mục con, có thể bỏ "Filter" hoặc điều chỉnh nó để phù hợp với cấu trúc thư mục.
- "Days": 30: Xóa các đối tượng sau 30 ngày kể từ ngày chúng được tải lên.
# 4. Tải bản sao lưu lên S3
Có thể tải các bản sao lưu của mình lên bucket với lệnh sau:
```shell
aws s3 cp /path/to/backup-file.tar.gz s3://my-backup-bucket/backups/
```
Lệnh này sẽ sao chép tập tin sao lưu từ hệ thống của bạn lên thư mục backups/ trong S3 bucket.
# 5. Kiểm tra Lifecycle Policy
Để kiểm tra xem Lifecycle Policy đã được áp dụng hay chưa, có thể sử dụng lệnh:
```shell
aws s3api get-bucket-lifecycle-configuration --bucket my-backup-bucket
```