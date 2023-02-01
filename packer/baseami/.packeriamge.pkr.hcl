variable "access_key" {
   type = string
   default = "AKIAQTKQ65YELANXGBVQ"
   sensitive = true
}

variable "secret_key" {
  type = string
  default = "X7pTA0h764Ma3NbfCH/nseUIVWKsDHOMCCqjpWWy"
  sensitive = true
}

variable "source_ami" {
  type = string
  default = "ami-098453baf108a57d0" #Redhat 7
  sensitive = true
}

source "amazon-ebs" "firstbuild" {
  ami_name        = "Redhat_packer_AWS {{timestamp}}"
  access_key      = var.access_key
  secret_key      = var.secret_key
  instance_type   = "t2.medium"
  region          = "us-east-1"
  source_ami      = var.source_ami
  ssh_username    = "ec2-user"
  communicator    = "ssh"
  #most_recent     = true
}

build {
  sources = ["source.amazon-ebs.firstbuild"]

      
provisioner "shell" {
    #inline = ["echo Connected via SSH at '${build.User}@${build.Host}:${build.Port}'"]
    scripts = ["scripts/installchef.sh"]
  }
}