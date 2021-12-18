provider "aws" {
   region = "ap-south-1"
   access_key = "****************************"
   secret_key = "************************************"
}

resource "aws_instance" "k8Master" {
  count         = var.kubernetes_master_count
  ami           = lookup(var.ami_kubernetes_master,var.aws_region)
  instance_type = var.instance_master_type
  key_name      = "Global"
  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 20
    volume_type = "gp2"
    encrypted   = "true"
    delete_on_termination =true
  }
   tags = {
    Name  = "KubernetesMaster-${count.index + 1}"
    Batch = "9AM"
  }
}

resource "aws_instance" "k8" {
  count         = var.kubernetes_count
  ami           = lookup(var.ami_kubernetes,var.aws_region)
  instance_type = var.instance_type
  key_name      = "Global"
  tags = {
    Name  = "KubernetesNode-${count.index + 1}"
    Batch = "5AM"
  }
}

resource "aws_instance" "JenkinsMaster" {
  count         = var.jenkins_count
  ami           = lookup(var.ami_jenkins,var.aws_region)
  instance_type = var.instance_type
  key_name      = "Global"
  tags = {
    Name  = "Jenkins-${count.index + 1}"
    Batch = "6AM"
  }

}

resource "aws_instance" "dbserver" {
  count         = var.dbserver_count 
  ami           = lookup(var.ami_dbserver,var.aws_region)
  instance_type = var.instance_type
  key_name      = "Global"
  tags = {
    Name  = "dbserver-${count.index + 1}"
    Batch = "7AM"
  }

}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "announment"
  username             = "admin"
  password             = "adminuser"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}
