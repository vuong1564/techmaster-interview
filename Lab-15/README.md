> Sử dụng GitHub Actions để thiết lập một workflow CI/CD cho dự án Python, bao gồm bước kiểm tra mã nguồn với pytest.​

# 1. Cấu hình GitHub Repository:
Trong repository , tạo thư mục .github/workflows nếu chưa có.
```shell
mkdir -p .github/workflows
```
Trong thư mục .github/workflows, tạo file ci-cd-pipeline.yml với nội dung như file đi kèm.
```shell
touch .github/workflows/ci-cd-pipeline.yml
```
Đi tới repository của trên GitHub:
- Vào Settings > Secrets and variables > Actions > New repository secret.
- Thêm các secrets cần thiết:

| Secret Name       | Giá trị (Value)                             |
|-------------------|---------------------------------------------|
| DOCKER_USERNAME   | Tên đăng nhập Docker của bạn                |
| DOCKER_PASSWORD   | Mật khẩu hoặc token Docker                  |
| VM_HOST           | Địa chỉ IP hoặc hostname của VM             |
| VM_USER           | Tên người dùng SSH trên VM                  |
| SSH_PRIVATE_KEY   | Khóa SSH cá nhân của bạn (private key)      |

    Lưu ý: Đảm bảo bạn tạo cặp khóa SSH (public/private) và thêm public key vào file ~/.ssh/authorized_keys trên VM cần deploy

Thực hiện push workflow lên trên repo cần deploy
```shell
git add .
git commit -m "Add CI/CD pipeline with GitHub Actions"
git push origin main
```
# 2. Kiểm Tra Kết Quả Workflow
Thực hiện 1 pull request vào nhánh main của source code

Vào repository trên GitHub.

Nhấn vào Actions từ thanh điều hướng.

Khi workflow hoàn tất, sẽ hiển thị trạng thái thành công hoặc thất bại.