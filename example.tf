terraform {
   backend "remote" {
          organization = "scottraignerR"
          workspaces {
                name = "terraform_cloud"
          }
  }
}

   provider "aws" {
	profile	= "default"
	region	= var.region
   }

   resource "aws_instance" example {
   	ami	= var.amis[var.region]
	instance_type = "t2.micro"

	provisioner "local-exec" {
	   command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
           }
   }

   resource "aws_eip" "ip2" {
	vpc = true
	instance = aws_instance.example.id
   }

   output "ip_out" {
        value = aws_eip.ip2.public_ip
   }
