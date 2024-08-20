    Thiết lập Auto Scaling Group trên AWS để tự động mở rộng hoặc thu hẹp số lượng EC2 instances dựa trên tải công việc
# 1. Cài đặt và cấu hình AWS CLI
Trước tiên, đảm bảo bạn đã cài đặt và cấu hình AWS CLI như trong bài lab 07.

# 2. Tạo Launch Template hoặc Launch Configuration
> Auto Scaling Group sử dụng Launch Template hoặc Launch Configuration để xác định cấu hình của EC2 instances. Chúng chứa thông tin như AMI ID, instance type, security group, key pair, và các thông số khác.
Tạo Launch Template:
```shell
aws ec2 create-launch-template \
    --launch-template-name MyLaunchTemplate \
    --version-description "v1" \
    --launch-template-data '{
        "ImageId": "ami-12345678",
        "InstanceType": "t2.micro",
        "KeyName": "MyKeyPair",
        "SecurityGroupIds": ["sg-12345678"],
        "TagSpecifications": [
            {
                "ResourceType": "instance",
                "Tags": [
                    {
                        "Key": "Name",
                        "Value": "AutoScalingInstance"
                    }
                ]
            }
        ]
    }'
```
# 3. Tạo Auto Scaling Group
Auto Scaling Group cần biết số lượng tối thiểu, tối đa, và mong muốn của các instances. Nó cũng cần biết Launch Template hoặc Launch Configuration đã tạo.
```shell
aws autoscaling create-auto-scaling-group \
    --auto-scaling-group-name MyAutoScalingGroup \
    --launch-template "LaunchTemplateName=MyLaunchTemplate,Version=1" \
    --min-size 1 \
    --max-size 5 \
    --desired-capacity 2 \
    --vpc-zone-identifier "subnet-12345678,subnet-87654321" \
    --tags Key=Name,Value=AutoScalingInstance,PropagateAtLaunch=true
```
Trong đó:
- --launch-template: Sử dụng template đã tạo ở bước trước.
- --min-size: Số lượng instances tối thiểu.
- --max-size: Số lượng instances tối đa.
- --desired-capacity: Số lượng instances mong muốn.
- --vpc-zone-identifier: Danh sách subnet nơi instances sẽ được tạo.
# 4. Thiết lập Auto Scaling Policy
>     Auto Scaling Policy được sử dụng để tự động điều chỉnh số lượng instances dựa trên các chỉ số (ví dụ: CPU usage).

Ví dụ: Thiết lập chính sách dựa trên CPU usage:
```shell
aws autoscaling put-scaling-policy \
    --auto-scaling-group-name MyAutoScalingGroup \
    --policy-name ScaleOutPolicy \
    --scaling-adjustment 1 \
    --adjustment-type ChangeInCapacity \
    --cooldown 300
```
Sau đó, liên kết chính sách này với CloudWatch Alarm:
```shell
aws cloudwatch put-metric-alarm \
    --alarm-name HighCPUAlarm \
    --metric-name CPUUtilization \
    --namespace AWS/EC2 \
    --statistic Average \
    --period 300 \
    --threshold 70 \
    --comparison-operator GreaterThanThreshold \
    --dimensions "Name=AutoScalingGroupName,Value=MyAutoScalingGroup" \
    --evaluation-periods 2 \
    --alarm-actions arn:aws:autoscaling:<region>:<account-id>:scalingPolicy:xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx:autoScalingGroupName/MyAutoScalingGroup:policyName/ScaleOutPolicy
```
# 5. Kiểm tra và quản lý Auto Scaling Group
Kiểm tra trạng thái của Auto Scaling Group bằng lệnh:
```shell
aws autoscaling describe-auto-scaling-groups --auto-scaling-group-names MyAutoScalingGroup
```
