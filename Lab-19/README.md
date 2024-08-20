    Tạo một Vagrantfile để dựng lên một môi trường ảo hóa với Ubuntu và cài đặt
    Docker trong máy ảo này.
# 1. Cài đặt VirtualBox:
    Máy chủ sử dụng để thử nghiệm cần thực hiện enable virtualization trong bios trước khi thực hiện để có thể start được máy ảo
Thực hiện truy cập vào máy chủ (ở đây chạy ubuntu) sử dụng để thử nghiệm
```shell
sudo apt install virtualbox -y
```
# 2. Cài đặt Vagrant:
Thực hiện tải file binary của vagrant
```shell
wget https://releases.hashicorp.com/vagrant/2.3.7/vagrant_2.3.7-1_amd64.deb
```
Thực hiện cài đặt vagrant
```shell
sudo dpkg -i vagrant_2.3.7-1_amd64.deb
```
Thực hiện kiểm tra sau khi cài đặt
```shell
vagrant --version
```
# 3. Khởi chạy máy ảo với Vagrant:
Thực hiện tạo [Vagrantfile](./Vagrantfile) 

Thực hiện khởi tạo máy ảo
```shell
vagrant up
```
# 4. Kết nối vào máy ảo:
Khi máy ảo đã được khởi động, có thể kết nối vào nó bằng lệnh:
```shell
vagrant ssh
```