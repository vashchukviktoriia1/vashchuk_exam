# VPC
resource "digitalocean_vpc" "vashchuk_vpc" {
  name     = "vashchuk-vpc"
  region   = "fra1"
  ip_range = "10.10.20.0/24"
}

# Firewall
resource "digitalocean_firewall" "vashchuk_firewall" {
  name        = "vashchuk-firewall"
  droplet_ids = [digitalocean_droplet.vashchuk_node.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "8000"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "8001"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "8002"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "8003"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}

# Droplet (VM)
resource "digitalocean_droplet" "vashchuk_node" {
  name     = "vashchuk-node"
  size     = "s-4vcpu-8gb"
  image    = "ubuntu-24-04-x64"
  region   = "fra1"
  vpc_uuid = digitalocean_vpc.vashchuk_vpc.id
}

# Spaces Bucket
resource "digitalocean_spaces_bucket" "vashchuk_bucket" {
  name   = "vashchuk-viktoriia-bucket"
  region = "fra1"
  acl    = "private"
}