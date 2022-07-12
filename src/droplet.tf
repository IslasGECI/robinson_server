resource "digitalocean_droplet" "robinsondata" {
  image  = "ubuntu-22-04-x64"
  name   = "robinsondata"
  region = "sfo3"
  size   = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.provisioner.id,
    data.digitalocean_ssh_key.evaro-desktop.id,
    data.digitalocean_ssh_key.evaro-laptop.id,
    data.digitalocean_ssh_key.nepo-desktop.id,
    data.digitalocean_ssh_key.nepo-laptop.id
  ]
  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.pvt_key)
    timeout     = "2m"
  }
}

resource "digitalocean_floating_ip_assignment" "robinsonip" {
  ip_address = "164.90.245.58"
  droplet_id = digitalocean_droplet.robinsondata.id
}
