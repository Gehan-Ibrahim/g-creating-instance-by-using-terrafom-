resource "aws_instance" "my-ec2"{
    ami="ami-0f3c9c466bb525749"
    instance_type="t2.micro"

tags = {
    Name = "gehan-ec2"
 }

}
resource  "aws_eip" "my-eip"{
    vpc = true
}
resource "aws_eip_association" "associate"{
    instance_id=aws_instance.my-ec2.id
    allocation_id=aws_eip.my-eip.id

}
output "subnet-id" {
    description = "VMs Private IP"
    value= aws_instance.my-ec2.subnet_id

}

output "instance_ip_addr" {
  value = aws_instance.my-ec2.private_ip
}
output "public_value" {
    description = "VMs Public IP"
    value= aws_instance.my-ec2.public_ip
}
terraform {
    backend "s3" {
    bucket = "gehanbucket"
    key    = "gehan-key"
    region = "us-east-2"
  }
}

