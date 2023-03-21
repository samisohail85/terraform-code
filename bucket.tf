# Create new storage bucket in the US multi-region
# with standard storage

resource "google_storage_bucket" "static-site" {
 project       = "kube-project-380713"
 name          = "eu-my-1st-bucket"
 location      = "eu"
 storage_class = "STANDARD"

 uniform_bucket_level_access = true
}
