resource "google_redis_instance" "cache" {
  name = "redis-cache-tf"
  memory_size_gb = 1
  tier = "BASIC"

  location_id = "us-central1-a"
  authorized_network = "default"

  redis_version = "REDIS_5_0"
  display_name = "redis instance from terrafom"
}
