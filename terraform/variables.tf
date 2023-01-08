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
  default     = "~/.ssh/id_rsa.pub"
  description = "IBM SSH key"
}

variable "image" {
  type        = string
  default     = "ibm-ubuntu-22-04-1-minimal-amd64-3"
  description = "IBM image"
}

variable "instance_name" {
  type        = string
  default     = "example-instance"
  description = "IBM instance name"
}

variable "instance_profile" {
  type        = string
  default     = "bx2-2x8"
  description = "IBM instance profile"
}
