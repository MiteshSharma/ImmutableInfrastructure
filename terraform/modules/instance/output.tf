output "instance_eip" {
  value = "${aws_eip.testInstanceEip.public_ip}"
}