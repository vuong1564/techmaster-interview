## Hướng dẫn sử dụng:
Thay đổi đường dẫn SOURCE_DIR và BACKUP_DIR thành các thư mục phù hợp với nhu cầu của bạn.

Cấp quyền thực thi cho script:

```shell
chmod +x backup.sh
```
Chạy script:
```shell
./backup.sh
```

## Giải thích:
Script sẽ tạo một bản sao lưu từ thư mục nguồn và nén thành file .tar.gz trong thư mục đích.

Tên file sao lưu sẽ bao gồm ngày giờ để dễ quản lý.

Script kiểm tra và tự động tạo thư mục sao lưu nếu chưa tồn tại.