
    Lab 18: Cấu hình Horizontal Pod Autoscaler (HPA) cho ứng dụng trên Kubernetes để tự động mở rộng số lượng Pod dựa trên tải công việc.​

# 0. Chuẩn bị môi trường
Thực hiện tạo cluster k8s và deploy service như bài lab [16&17](./../Lab-16&17/README.md)
# 1. Cài đặt Metrics Server
HPA cần Metrics Server để thu thập thông tin về tài nguyên (CPU, bộ nhớ) sử dụng của các Pod. Đảm bảo Metrics Server đã được cài đặt trong cluster.
```shell
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```
# 2. Xác minh Metrics Server đã hoạt động
```shell
kubectl get pods -n kube-system
```
Đảm bảo rằng pod của Metrics Server đang chạy mà không có lỗi.

# 3. Cấu hình Horizontal Pod Autoscaler
Tạo một file cấu hình [hpa.yaml](./hpa.yaml) cho HPA:

Giải thích:

- scaleTargetRef: Chỉ định Deployment mà HPA sẽ quản lý.
- minReplicas: Số lượng Pod tối thiểu.
- maxReplicas: Số lượng Pod tối đa.
- metrics: Loại tài nguyên mà HPA sẽ theo dõi (trong trường hợp này là CPU). averageUtilization là tỷ lệ phần trăm sử dụng CPU mà HPA sẽ dựa vào để tự động điều chỉnh số lượng Pod.

# 4. Triển khai HPA:
```shell
kubectl apply -f hpa.yaml
```
Xem chi tiết của HPA:
```shell
kubectl describe hpa web-app-hpa
```
# 5. Kiểm tra HPA hoạt động
Để kiểm tra HPA hoạt động, có thể tạo tải công việc trên ứng dụng đã được deploy. Ví dụ, có thể tạo một Pod riêng biệt để gửi yêu cầu HTTP đến ứng dụng với số lượng lớn

Tạo fille [load-generator.yaml](./load-generator.yaml)

Triển khai Pod tải công việc:
```shell
kubectl apply -f load-generator.yaml
```
Với cấu hình HPA, số lượng Pod trong Deployment sẽ tự động điều chỉnh dựa trên tải công việc và mức sử dụng CPU đã cấu hình.