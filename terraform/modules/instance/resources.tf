provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "instance" {
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${var.subnet_public_id}"
  vpc_security_group_ids = ["${var.security_group_ids}"]
  key_name = "${var.key_pair_name}"

  tags {
		"Environment" = "${var.environment_tag}"
	}
}

resource "aws_eip" "testInstanceEip" {
  vpc       = true
  instance  = "${aws_instance.instance.id}"

  tags {
    "Environment" = "${var.environment_tag}"
  }
}