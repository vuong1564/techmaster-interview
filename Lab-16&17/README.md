    Lab 16: Cài đặt một Kubernetes cluster sử dụng Minikube và triển khai một ứng dụng web đơn giản lên cluster
    Lab 17: Viết file YAML để định nghĩa một Deployment và Service cho ứng dụng web trên Kubernetes.​
# 1. Cài đặt Minikube
Trên máy chủ thử nghiệm (ở đây sử dụng ubuntu) thực hiện chạy lệnh:
```shell
sudo apt update
sudo apt install -y curl
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```
# 2. Cài đặt Kubectl
Trên máy chủ thử nghiệm (ở đây sử dụng ubuntu) thực hiện chạy lệnh:
```shell
sudo apt update
sudo apt install -y kubectl
```
# 3. Khởi động Minikube
```shell
minikube start
```



# 4. Triển khai ứng dụng web đơn giản
Tạo một file cấu hình [deployment.yaml](./deployment.yaml) và [service.yaml](./service.yaml) cho ứng dụng web của bạn (ví dụ, một ứng dụng Nginx)

Triển khai ứng dụng và dịch vụ:
```shell
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```
# 5. Kiểm tra và truy cập ứng dụng
Xem các pod và dịch vụ:
```shell
kubectl get pods
kubectl get services
```
Lấy địa chỉ IP và cổng để truy cập ứng dụng:
```shell
minikube service web-service --url
```
