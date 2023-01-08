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

resource "ibm_is_security_group" "sg" {
  name = var.instance_name
  vpc  = ibm_is_vpc.testacc_vpc.id
}

# security group rule to allow ssh
resource "ibm_is_security_group_rule" "ssh" {
  depends_on = [ibm_is_security_group.sg]
  group      = ibm_is_security_group.sg.id
  direction  = "inbound"
  remote     = "0.0.0.0/0"
  tcp {
    port_min = 22
    port_max = 22
  }
}

# security group rule to run bwb on browser
resource "ibm_is_security_group_rule" "bwb" {
  depends_on = [ibm_is_security_group_rule.ssh]
  group      = ibm_is_security_group.sg.id
  direction  = "inbound"
  remote     = "0.0.0.0/0"
  tcp {
    port_min = var.bwb_port
    port_max = var.bwb_port
  }
}

# security group rule to allow all for outbound
resource "ibm_is_security_group_rule" "outbound" {
  depends_on = [ibm_is_security_group_rule.bwb]
  group      = ibm_is_security_group.sg.id
  direction  = "outbound"
  remote     = "0.0.0.0/0"
}

# Image for Virtual Server Insance
data "ibm_is_image" "image" {
  name = var.image
}

resource "ibm_is_ssh_key" "ssh_key" {
  name       = "example-key"
  public_key = "${file(pathexpand(var.ssh_key))}"
}

# Create a virtual server instance
resource "ibm_is_instance" "tf_instance" {
  depends_on = [ibm_is_security_group_rule.outbound]

  name    = var.instance_name
  image   = data.ibm_is_image.image.id
  profile = var.instance_profile

  primary_network_interface {
    subnet          = ibm_is_subnet.test_subnet.id
    security_groups = [ibm_is_security_group.sg.id]
  }

  vpc  = ibm_is_vpc.testacc_vpc.id
  zone = var.zone
  keys = [ibm_is_ssh_key.ssh_key.id]
}

# Reserve a floating ip
resource "ibm_is_floating_ip" "testacc_floatingip" {
  name   = var.instance_name
  target = ibm_is_instance.tf_instance.primary_network_interface[0].id
}
