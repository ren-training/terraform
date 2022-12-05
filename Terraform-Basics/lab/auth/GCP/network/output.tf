output "vpc_id" {
  value = google_compute_network.vpc_network.id
}

output "subnet_id" {
  value = google_compute_subnetwork.my-subnetwork.id
}

output "firewall_id" {
  value = google_compute_firewall.allow-ssh.id
}