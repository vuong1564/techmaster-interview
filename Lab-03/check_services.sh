#!/bin/bash

# Cấu hình
SERVICES=("nginx" "mysql")                     # Các dịch vụ cần kiểm tra
EMAIL="your-email@example.com"                # Email nhận thông báo
SUBJECT="Cảnh báo: Dịch vụ hệ thống bị dừng"  # Chủ đề email
MAIL_CMD=$(which mail)                        # Lệnh gửi email (phải cài đặt sẵn)
ALERT=0                                       # Biến cờ để kiểm tra nếu có dịch vụ bị dừng

# Kiểm tra trạng thái các dịch vụ
for SERVICE in "${SERVICES[@]}"; do
    if systemctl is-active --quiet $SERVICE; then
        echo "$SERVICE đang chạy."
    else
        echo "$SERVICE bị dừng!"
        ALERT=1
        ALERT_MSG="$ALERT_MSG\n$SERVICE đã bị dừng!"
    fi
done

# Nếu có dịch vụ bị dừng, gửi email cảnh báo
if [ $ALERT -eq 1 ]; then
    echo -e "Cảnh báo:\n\n$ALERT_MSG" | $MAIL_CMD -s "$SUBJECT" "$EMAIL"
fi
