resource "google_storage_bucket" "GCS1" {
    name = "bucket-frm-tf"

    storage_class = "nearline"

    location = "us-central1"
    
    labels = {
      "env" = "tf_env"
      "dep" = "complience"
    }
  uniform_bucket_level_access = true
  

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "SetStorageClass"
      storage_class = "coldline"
    }
  }

  retention_policy{
    is_locked = true
    retention_period = 864000
  }
}


resource "google_storage_bucket_object" "name"  {
  name   = "pict1"
  source = "buck 2.PNG"
  bucket = google_storage_bucket.GCS1.name
}