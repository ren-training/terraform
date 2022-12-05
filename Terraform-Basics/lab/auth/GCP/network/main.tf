resource "google_compute_network" "vpc_network" {
  name                    = "vpc-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my-subnetwork" {
  name          = "my-subnetwork"
  network       = google_compute_network.vpc_network.name
  ip_cidr_range = "10.1.0.0/24"
}

resource "google_compute_firewall" "allow-ssh" {
  name        = "allow-ssh"
  network     = google_compute_network.vpc_network.name
  description = "Firewall rule to allow ssh to all instances"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]

  priority = 500
  disabled = false
}