variable "ibmcloud_api_key" {
  type        = string
  description = "IBM Cloud API key"
}

variable "region" {
  type    = string
  default = "us-south"
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

variable "ssh_key" {
  type        = string
  default     = "/home/bschmitz/.ssh/id_rsa"
  description = "IBM SSH key."
}

variable "image" {
  type        = string
  default     = "ubuntu-22.04.x-amd64"
  description = "IBM image."
}

variable "instance_name" {
  type        = string
  default     = "example-instance"
  description = "IBM instance name."
}

variable "instance_profile" {
  type        = string
  default     = "bc1-2x8"
  description = "IBM instance profile."
}
