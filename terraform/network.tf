# Create a VPC
resource "ibm_is_vpc" "testacc_vpc" {
  name = var.instance_name
}

# Create subnet
resource "ibm_is_subnet" "test_subnet" {
  name            = var.instance_name
  vpc             = ibm_is_vpc.testacc_vpc.id
  zone            = var.zone
  ipv4_cidr_block = var.ipv4_subnet
}
