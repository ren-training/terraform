terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("C:\\path\\to\\file.json")
  project     = var.PROJECT_NAME
  region      = "us-central1"
  zone        = "us-central1-a"
}

# resource "google_compute_network" "vpc-network" {
#   name = "terraform-network"
# }

resource "google_compute_instance" "my-instance" {
  name         = "my-instance"
  machine_type = "e2-small"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    # network = google_compute_network.vpc-network.name
    network = "default"
    access_config {}
  }

  metadata_startup_script = "echo hi > /test.txt"

}

