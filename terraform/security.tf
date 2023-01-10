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
