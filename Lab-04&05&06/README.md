# Lab 04&05 Hướng dẫn chạy Docker Compose:
Build và chạy các dịch vụ:
```shell
docker-compose up --build
```
# Lab 06 Tạo một Docker Swarm cluster với ít nhất 3 nodes và triển khai ứng dụng web đã xây dựng

## 1. Thiết lập Docker Swarm Cluster
Giả sử có 3 máy chủ. Các máy chủ này sẽ đóng vai trò làm các node trong cluster.
Các máy chủ:
- Manager node: manager
- Worker node 1: worker1
- Worker node 2: worker2
### Bước 1: Khởi tạo Swarm trên Manager node
Trên node manager, chạy lệnh sau để khởi tạo Docker Swarm:
```shell
docker swarm init --advertise-addr <Manager-IP>
```
Lệnh này sẽ xuất ra một lệnh để bạn có thể thêm các worker nodes vào cluster. Nó trông sẽ giống như thế này:
```shell
docker swarm join --token <TOKEN> <Manager-IP>:2377
```
### Bước 2: Thêm Worker nodes vào Swarm cluster
Trên worker1 và worker2, chạy lệnh join được cung cấp ở trên để thêm chúng vào cluster:
```shell
docker swarm join --token <TOKEN> <Manager-IP>:2377
```
Kiểm tra các node trong cluster bằng cách chạy:
```shell
docker node ls
```

## 2. Build Docker Image cho ứng dụng Flask
Trên node manager, build image của ứng dụng Flask:
```shell
docker build -t flask-app .
```
## 3.Push Image lên Docker Registry
Push image đã build lên một Image Registry (như Docker Hub hoặc một private registry).
```shell
docker tag flask-app <your-dockerhub-username>/flask-app:latest
docker push <your-dockerhub-username>/flask-app:latest
```
Thay đổi image: flask-app:latest thành image: <your-dockerhub-username>/flask-app:latest trong file docker-compose.yml.
## 4.Triển khai ứng dụng với Docker Stack
Trên node manager, chạy lệnh sau để triển khai ứng dụng:
```shell
docker stack deploy -c docker-compose.yml flask-swarm
```
Lệnh này sẽ triển khai ứng dụng Flask cùng với PostgreSQL trên Swarm cluster. Có thể kiểm tra trạng thái của stack bằng lệnh:
```shell
docker stack services flask-swarm
```