    Sử dụng Vagrant để dựng lên một multi-machine environment với một máy ảo chạy ứng dụng web và một máy ảo khác chạy cơ sở dữ liệu
# 0. Đảm bảo môi trường:
Đảm bảo máy chủ thực hiện thử nghiệm đã được cài đặt vagrant và VirtualBox như [hướng dẫn](./../Lab-19/README.md)

# 1. Khởi chạy máy ảo với Vagrant:
Thực hiện tạo [Vagrantfile](./Vagrantfile) trong đó
- Máy ảo web sẽ cài đặt và khởi động Nginx.
- Máy ảo db sẽ cài đặt và khởi động MySQL.
- Cả hai máy ảo sẽ sử dụng mạng riêng (private network) để giao tiếp với nhau.

Sau khi đã chỉnh sửa xong Vagrantfile, bạn có thể khởi tạo và khởi động máy ảo bằng lệnh:
```shell
vagrant up
```
# 2. Kết nối vào máy ảo:
Để kết nối vào máy ảo ứng dụng web:
```shell
vagrant ssh web
```
Để kết nối vào máy ảo cơ sở dữ liệu:
```shell
vagrant ssh db
```
