resource "google_compute_instance" "vm-from-tf" {
 name = "vm-from-tf"

zone = "us-central1-a"

machine_type = "n1-standard-2"

allow_stopping_for_update = true

network_interface {
  network = "custom-vpc-tf"
  subnetwork = "sub-sg"
}

boot_disk {
  initialize_params {
    image = "centos-7-v20230306"
    size = 25
  }
  auto_delete = false
}

labels = {
  "env" = "tf-learning"
}

scheduling {
  preemptible = false
  automatic_restart = false
  
}

service_account {
  email ="gcp-terraform@fiery-outpost-381205.iam.gserviceaccount.com"
  scopes = ["cloud-platform"]
}
lifecycle {
  ignore_changes = [
    attached_disk
  ]
}
}

resource "google_compute_disk" "disk-1" {
  name = "disk-1"
  size = 15
  zone = "us-central1-a"
  type = "pd-ssd"
}

resource "google_compute_attached_disk" "adisk" {
  disk = google_compute_disk.disk-1.id
  instance = google_compute_instance.vm-from-tf.id
}
