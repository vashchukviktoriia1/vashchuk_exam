output "droplet_ip" {
  value = digitalocean_droplet.vashchuk_node.ipv4_address
}

output "bucket_name" {
  value = digitalocean_spaces_bucket.vashchuk_bucket.name
}

output "vpc_id" {
  value = digitalocean_vpc.vashchuk_vpc.id
}