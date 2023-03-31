variable "instance_count" {
  type    = number
  default = 1
}

variable "ibmcloud_api_key" {
  type        = string
  description = "IBM API key"
}

variable "region" {
  type        = string
  default     = "us-south"
  description = "IBM region"
}

variable "ssh_key" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "IBM public SSH key"
}

locals {
  public_ssh_key = file(pathexpand(var.ssh_key))
}

variable "zone" {
  type    = string
  default = "us-south-1"
}

variable "ipv4_subnet" {
  type    = string
  default = "10.240.0.0/24"
}

variable "bwb_port" {
  type    = number
  default = 6080
}

variable "image" {
  type        = string
  description = "IBM image"
}

variable "instance_name" {
  type        = string
  default     = "ibm-vm"
  description = "IBM instance name"
}

variable "instance_profile" {
  type        = string
  default     = "bx2-2x8"
  description = "IBM instance profile"
}
