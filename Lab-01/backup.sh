#!/bin/bash

# Cấu hình thư mục nguồn và đích
SOURCE_DIR="/path/to/source/directory"
BACKUP_DIR="/path/to/backup/directory"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="backup_$TIMESTAMP.tar.gz"

# Kiểm tra xem thư mục đích có tồn tại không, nếu không thì tạo mới
if [ ! -d "$BACKUP_DIR" ]; then
  mkdir -p "$BACKUP_DIR"
fi

# Thực hiện sao lưu và nén thư mục nguồn
tar -czf "$BACKUP_DIR/$BACKUP_FILE" -C "$SOURCE_DIR" .

# Kiểm tra kết quả sao lưu
if [ $? -eq 0 ]; then
  echo "Sao lưu thành công! File được lưu tại: $BACKUP_DIR/$BACKUP_FILE"
else
  echo "Sao lưu thất bại."
fi
