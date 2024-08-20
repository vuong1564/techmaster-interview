Chạy lệnh sau trong terminal
```shell
crontab -e
```
Thêm dòng sau vào cuối file
```shell
0 2 * * * /path/to/backup.sh
```
## Giải thích:
    0 2 * * *: Thời gian để chạy script. Ở đây:
    0: phút (0 phút)
    2: giờ (2 giờ sáng)
    *: ngày trong tháng (mỗi ngày)
    *: tháng (mỗi tháng)
    *: ngày trong tuần (mọi ngày trong tuần)
    /path/to/backup.sh: Đường dẫn đầy đủ đến file script backup.sh mà bạn đã tạo.
## Lưu và thoát
## Kiểm tra cron job
Kiểm tra các cron job đã được thiết lập bằng lệnh
```shell
crontab -l
```