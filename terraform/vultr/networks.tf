# mgmt, tunnel, storage

resource "vultr_private_network" "mgmt" {
  description    = "Management network"
  region         = "ewr"
  v4_subnet      = "172.29.220.0"
  v4_subnet_mask = 22
}

resource "vultr_private_network" "tunnel" {
  description    = "Tunnel (VXLAN) network"
  region         = "ewr"
  v4_subnet      = "172.29.224.0"
  v4_subnet_mask = 22
}

resource "vultr_private_network" "storage" {
  description    = "Storage Network"
  region         = "ewr"
  v4_subnet      = "172.29.228.0"
  v4_subnet_mask = 22
}

resource "vultr_private_network" "mgmt2" {
  description    = "Management network"
  region         = "ewr"
  v4_subnet      = "172.29.220.0"
  v4_subnet_mask = 22
}

resource "vultr_private_network" "tunnel2" {
  description    = "Tunnel (VXLAN) network"
  region         = "ewr"
  v4_subnet      = "172.29.224.0"
  v4_subnet_mask = 22
}

