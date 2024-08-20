> Tạo một Jenkins pipeline để thực hiện các bước xây dựng, kiểm tra và triển khai ứng dụng Docker.​

# 1. Thiết lập môi trường Jenkins:
Cài đặt Jenkins và cấu hình các plugins cần thiết như Docker, Pipeline, Git, Docker Pipeline.

Đảm bảo Jenkins có quyền truy cập vào Docker daemon.

# 2. Tạo Jenkinsfile:
Giải thích nội dung trong file:
- agent: Sử dụng Docker image ổn định để chạy các bước trong pipeline.
- environment: Định nghĩa các biến môi trường, như tên Docker registry và image.
- stages: Gồm nhiều giai đoạn như:
    - Checkout: Lấy mã nguồn từ Git repository.
    - Build: Xây dựng Docker image.
    - Test: Chạy các bài kiểm tra.
    - Push to Registry: Đẩy image lên Docker registry (Docker Hub).
    - Deploy: Triển khai ứng dụng lên server.
- post: Dọn dẹp các tài nguyên sau khi pipeline chạy xong.

# 3. Cấu hình Jenkins:
Đảm bảo các credentials đã được tạo trong Jenkins cho Docker registry (dockerhub-credentials-id) và SSH deploy server (deploy-server-credentials).
# 4. Chạy pipeline:
Đưa Jenkinsfile vào thư mục gốc của repository.

Cấu hình Jenkins job để sử dụng pipeline từ Jenkinsfile.