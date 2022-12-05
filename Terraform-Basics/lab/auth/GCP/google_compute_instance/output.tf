output "ip" {
  value = google_compute_instance.my-instance.network_interface.0.network_ip
}