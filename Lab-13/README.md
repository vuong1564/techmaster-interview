> Thiết lập một pipeline CI/CD trên GitLab để tự động xây dựng, kiểm tra và triển khai một ứng dụng web.​

# Bước 1: Cấu hình file .gitlab-ci.yml
Trong root của repository GitLab, tạo một file tên là .gitlab-ci.yml. Đây là nơi định nghĩa các bước trong pipeline.
Trong đó:
- stages: Các giai đoạn của pipeline được thực thi tuần tự. Các stage gồm: build, test, và deploy.
- variables: Biến môi trường được định nghĩa và có thể sử dụng trong toàn bộ pipeline.
- before_script: Các lệnh được chạy trước mỗi job. Thường dùng để cài đặt dependencies.
- build_job: Job này nằm trong stage build, dùng để xây dựng ứng dụng.
- test_job: Job này kiểm thử ứng dụng sau khi build thành công.
- deploy_job: Job này thực thi việc triển khai, ví dụ như sao chép các file đã build lên server.

# Bước 2: Kết nối GitLab Runner
> GitLab CI/CD yêu cầu một GitLab Runner để thực thi các job. Bước này sẽ hướng dẫn thực hiện đăng ký runner với gitlab
## 1. Cài đặt GitLab Runner

Truy cập máy chủ muốn cài đặt GitLab Runner.
Cài đặt GitLab Runner:
- Trên Ubuntu/Debian:
```shell
sudo apt-get install -y curl
curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64
sudo chmod +x /usr/local/bin/gitlab-runner
sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
sudo gitlab-runner start
```
- Trên CentOS/Fedora/RHEL:
```shell
sudo yum install -y curl
curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64
sudo chmod +x /usr/local/bin/gitlab-runner
sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
sudo gitlab-runner start
```
Kiểm tra cài đặt:
```shell
gitlab-runner --version
```
## 2. Đăng ký GitLab Runner với dự án GitLab

Vào trang dự án của bạn trên GitLab, chọn Settings > CI/CD > Runners

Lấy URL và Token của Runner: Trong mục Runners, sẽ có URL GitLab và Token để đăng ký Runner

Đăng ký Runner trên máy chủ bằng cách chạy lệnh sau trên máy chủ runner
```shell
sudo gitlab-runner register
```
Các thông tin cần cung cấp
- GitLab instance URL: Nhập URL mà bạn đã thấy trong GitLab (ví dụ: https://gitlab.com/).
- Registration token: Nhập token mà bạn đã sao chép từ trang cài đặt CI/CD.
- Description: Mô tả cho runner (ví dụ: My-Project-Runner).
- Tags: Tags giúp bạn gán các job cụ thể cho runner này (ví dụ: docker, web, test).
- Executor: Chọn loại executor, ví dụ:
    - shell (chạy lệnh shell trực tiếp)
    - docker (dùng Docker containers)
    - virtualbox, v.v.
## 3. Kiểm tra Runner đã kết nối
Quay lại GitLab, trong phần Settings > CI/CD > Runners, bạn sẽ thấy runner mới được thêm vào danh sách Available Runners.

# Bước 3: Thực hiện kiểm tra kết quả
Thực hiện tạo 1 commit mới trên nhánh main để kiểm tra pipeline có được trigger và chạy thành công hay không
