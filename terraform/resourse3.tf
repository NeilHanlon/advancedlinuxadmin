resource "digitalocean_droplet" "openstackaio-3" {
  image              = "rockylinux-8-x64"
  name               = "openstackaio-3"
  region             = "nyc3"
  size               = "g-8vcpu-32gb"
  private_networking = true
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]
  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.pvt_key)
    timeout     = "2m"
  }
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "dnf -y upgrade",
      "dnf -y install git-core",
      "systemctl stop firewalld",
      "systemctl mask firewalld",
      "sed -i 's/enforcing/disabled/' /etc/sysconfig/selinux",
      "dnf -y install git wget python36",
      "pip3 install virtualenv",
    ]
  }
}

resource "digitalocean_project_resources" "openstackaio-3" {
  project = data.digitalocean_project.advancedlsa.id
  resources = [
    digitalocean_droplet.openstackaio-3.urn,
    digitalocean_volume.openstackdata.urn
  ]
}

