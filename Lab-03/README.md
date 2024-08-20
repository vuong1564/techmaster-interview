## Hướng dẫn sử dụng
1. Thay đổi danh sách dịch vụ trong biến SERVICES thành các dịch vụ bạn muốn kiểm tra.

2. Thay đổi biến EMAIL thành địa chỉ email bạn muốn nhận thông báo.

3. Lưu script này với tên ví dụ: check_services.sh.

4. Cấp quyền thực thi cho script:
```shell
chmod +x check_services.sh
```
5. Cài đặt lệnh mail nếu chưa có:
- Trên Ubuntu/Debian:
```shell
sudo apt-get install mailutils
```
- Trên CentOS/RHEL:
```shell
sudo yum install mailx
```
6. Chạy script:
```shell
./check_services.sh
```
## Thiết lập cron job để kiểm tra tự động
Thiết lập cron job để kiểm tra định kỳ mỗi 5 phút:
```shell
*/5 * * * * /path/to/check_services.sh
```
## Giải thích 
- Script kiểm tra trạng thái của từng dịch vụ trong danh sách SERVICES bằng lệnh systemctl is-active.
- Nếu dịch vụ nào bị dừng, script sẽ thiết lập cờ cảnh báo và gửi email thông báo.
- Lệnh mail được sử dụng để gửi email cảnh báo.
