# Image for Virtual Server Instance
data "ibm_is_image" "image" {
  name = var.image
}

# Public SSH key
resource "ibm_is_ssh_key" "ssh_key" {
  name       = "terraform-bwb-key"
  public_key = local.public_ssh_key
}

# Create a virtual server instance
resource "ibm_is_instance" "tf_instance" {
  depends_on = [ibm_is_security_group_rule.outbound]

  count   = var.instance_count
  name    = "${var.instance_name}-${count.index}"
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
  count      = var.instance_count
  depends_on = [ibm_is_instance.tf_instance]
  name       = "${var.instance_name}-${count.index}"
  target     = ibm_is_instance.tf_instance[count.index].primary_network_interface[0].id
}
