variable "ami_kubernetes_master" {
  type = map(string)
  default = {
    "ap-south-1" = "ami-026f33d38b6410e30"
  }
}

variable "ami_kubernetes" {
  type = map(string)

  default = {
    "ap-south-1" = "ami-026f33d38b6410e30"
  }
}

variable "ami_jenkins" {
  type = map(string)
  default = {
    "ap-south-1" = "ami-0567e0d2b4b2169ae"
  }
}
variable "ami_dbserver" {
  type = map(string)
  default = {
    "ap-south-1" = "ami-026f33d38b6410e30"
  }
}

variable "kubernetes_master_count" {
  default = "3"
}


variable "kubernetes_count" {
  default = "6"
}

variable "jenkins_count" {
  default = "3"
}

variable "dbserver_count" {
  default = "1"
}

variable "instance_master_type" {
  default = "t2.medium"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "aws_region" {
  default = "ap-south-1"
}
