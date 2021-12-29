#resource "vultr_instance" "infra2" {
#  plan                = "vdc-2c-8gb"
#  region              = "ewr"
#  os_id               = "448"
#  label               = "advancedlsa infra controlplane"
#  tag                 = "advancedlsa"
#  hostname            = "ala-infra2"
#  enable_ipv6         = false
#  backups             = "disabled"
#  ddos_protection     = false
#  activation_email    = false
#  script_id           = "0eeabbfb-2d2f-4797-a85a-82d3e1f235bd"
#  ssh_key_ids         = [vultr_ssh_key.terraform.id]
#  private_network_ids = [vultr_private_network.mgmt2.id, vultr_private_network.tunnel2.id, vultr_private_network.storage.id]
#}
#
#resource "vultr_instance" "compute2" {
#  plan                = "vdc-2vcpu-8gb"
#  region              = "ewr"
#  os_id               = "448"
#  label               = "advancedlsa compute"
#  tag                 = "advancedlsa"
#  hostname            = "ala-compute2"
#  enable_ipv6         = false
#  backups             = "disabled"
#  ddos_protection     = false
#  activation_email    = false
#  script_id           = "0eeabbfb-2d2f-4797-a85a-82d3e1f235bd"
#  ssh_key_ids         = [vultr_ssh_key.terraform.id]
#  private_network_ids = [vultr_private_network.mgmt2.id, vultr_private_network.tunnel2.id, vultr_private_network.storage.id]
#}
#
#resource "vultr_instance" "storage2" {
#  plan                = "vc2-4c-8gb"
#  region              = "ewr"
#  os_id               = "448"
#  label               = "advancedlsa storage"
#  tag                 = "advancedlsa"
#  hostname            = "ala-storage2"
#  enable_ipv6         = false
#  backups             = "disabled"
#  ddos_protection     = false
#  activation_email    = false
#  script_id           = "0eeabbfb-2d2f-4797-a85a-82d3e1f235bd"
#  ssh_key_ids         = [vultr_ssh_key.terraform.id]
#  private_network_ids = [vultr_private_network.mgmt2.id, vultr_private_network.storage.id]
#}
#
#resource "vultr_block_storage" "cinder2" {
#  size_gb              = 100
#  region               = "ewr"
#  label                = "ala-storage2-cinder"
#  attached_to_instance = vultr_instance.storage2.id
#}
#
#
#resource "vultr_instance" "storage2_2" {
#  plan                = "vc2-4c-8gb"
#  region              = "ewr"
#  os_id               = "448"
#  label               = "advancedlsa storage"
#  tag                 = "advancedlsa"
#  hostname            = "ala-storage2-2"
#  enable_ipv6         = false
#  backups             = "disabled"
#  ddos_protection     = false
#  activation_email    = false
#  script_id           = "0eeabbfb-2d2f-4797-a85a-82d3e1f235bd"
#  ssh_key_ids         = [vultr_ssh_key.terraform.id]
#  private_network_ids = [vultr_private_network.mgmt2.id, vultr_private_network.storage.id]
#}
#
#resource "vultr_block_storage" "cinder2_2" {
#  size_gb              = 100
#  region               = "ewr"
#  label                = "ala-storage2-2-cinder"
#  attached_to_instance = vultr_instance.storage2_2.id
#}
