terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.44.1"
    }
  }
}

provider "google" {
  credentials = file("C:\\path\\to\\file.json")
  project     = var.PROJECT_NAME
  region      = var.region_name
  zone        = var.zone
}