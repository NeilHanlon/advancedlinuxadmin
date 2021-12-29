terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "2.5.0"
    }
  }
}

variable "vultr_api_key" {}
variable "pvt_key" {}

provider "vultr" {
  api_key     = var.vultr_api_key
  rate_limit  = 700
  retry_limit = 3
}

resource "vultr_ssh_key" "terraform" {
  name    = "advancedlsa-ed25519"
  ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINjvRik77vZm9Uy8mxnQakfsWLrkpwYLoVT/TdxScoWj advancedlsa_terraform"
}
