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
  region      = "us-central1"
  zone        = "us-central1-a"
}

# create a bucket
resource "google_storage_bucket" "my-tf-bucket-1" {
  name = "my-tf-bucket-1"
  location = "us-central1"
  force_destroy = true

  storage_class = "STANDARD"
  public_access_prevention = "inherited"
}


# upload an image in the newly created bucket
resource "google_storage_bucket_object" "my-picture" {
  name = "mario"
  source = "mario.jpg"
  bucket = google_storage_bucket.my-tf-bucket-1.name
}

# make the object accessible to all 
resource "google_storage_object_access_control" "public-access" {
  bucket = google_storage_bucket.my-tf-bucket-1.name
  object = google_storage_bucket_object.my-picture.name
  entity = "allUsers"
  role = "READER"

}