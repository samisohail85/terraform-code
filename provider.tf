terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.58.0"
    }
  }
}
provider "google" {
  project = "fiery-outpost-381205"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = "fiery-outpost-381205-649778cd349c.json"
}
