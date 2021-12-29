resource "vultr_instance" "infra1" {
  plan                = "vdc-2c-8gb"
  region              = "ewr"
  os_id               = "448"
  label               = "infra1"
  tag                 = "advancedlsa infra"
  hostname            = "ala-infra1"
  enable_ipv6         = false
  backups             = "disabled"
  ddos_protection     = false
  activation_email    = false
  script_id           = "0eeabbfb-2d2f-4797-a85a-82d3e1f235bd"
  ssh_key_ids         = [vultr_ssh_key.terraform.id]
  private_network_ids = [vultr_private_network.mgmt.id, vultr_private_network.tunnel.id, vultr_private_network.storage.id]
}

resource "vultr_instance" "compute1" {
  plan                = "vdc-2c-8gb"
  region              = "ewr"
  os_id               = "448"
  label               = "compute1"
  tag                 = "advancedlsa compute"
  hostname            = "ala-compute1"
  enable_ipv6         = false
  backups             = "disabled"
  ddos_protection     = false
  activation_email    = false
  script_id           = "0eeabbfb-2d2f-4797-a85a-82d3e1f235bd"
  ssh_key_ids         = [vultr_ssh_key.terraform.id]
  private_network_ids = [vultr_private_network.mgmt.id, vultr_private_network.tunnel.id, vultr_private_network.storage.id]
}

resource "vultr_instance" "storage1" {
  plan                = "vc2-4c-8gb"
  region              = "ewr"
  os_id               = "448"
  label               = "storage1"
  tag                 = "advancedlsa storage"
  hostname            = "ala-storage1"
  enable_ipv6         = false
  backups             = "disabled"
  ddos_protection     = false
  activation_email    = false
  script_id           = "0eeabbfb-2d2f-4797-a85a-82d3e1f235bd"
  ssh_key_ids         = [vultr_ssh_key.terraform.id]
  private_network_ids = [vultr_private_network.mgmt.id, vultr_private_network.storage.id]
}

resource "vultr_block_storage" "cinder" {
  size_gb              = 100
  region               = "ewr"
  label                = "ala-storage-cinder"
  attached_to_instance = vultr_instance.storage1.id
}


