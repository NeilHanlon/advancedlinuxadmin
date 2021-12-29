resource "digitalocean_droplet" "openstackaio-1" {
  image              = "rockylinux-8-x64"
  name               = "openstackaio-1"
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
      "git clone https://github.com/NeilHanlon/openstack-ansible.git /opt/openstack-ansible",
      "cd /opt/openstack-ansible && git checkout feature/rocky8",
      "/opt/openstack-ansible/scripts/bootstrap-ansible.sh",
      "/opt/openstack-ansible/scripts/bootstrap-aio.sh",
    ]
  }
  provisioner "file" {
    source      = "files/user_lxc.yml"
    destination = "/etc/openstack_deploy/user_lxc.yml"
  }
}

resource "digitalocean_project_resources" "openstackaio-1" {
  project = data.digitalocean_project.advancedlsa.id
  resources = [
    digitalocean_droplet.openstackaio-1.urn,
    digitalocean_volume.openstackdata.urn
  ]
}


resource "digitalocean_volume" "openstackdata" {
  region                  = "nyc3"
  name                    = "kvmdata"
  size                    = 100
  initial_filesystem_type = "xfs"
  description             = "volume for openstack shit"
}

resource "digitalocean_volume_attachment" "openstackaio_volume1" {
  droplet_id = digitalocean_droplet.openstackaio-1.id
  volume_id  = digitalocean_volume.openstackdata.id
}
