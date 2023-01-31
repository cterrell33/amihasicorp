variable "access_key" {
   type = string
   default = "AKIAUB3MR75KE4UOVCPJ"
   sensitive = true
}

variable "secret_key" {
  type = string
  default = "a3wNwl2WI0lbCn550U+7C5xk5Zec4ntMUJ6DoMdE"
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