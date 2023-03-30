resource "google_sql_database_instance" "mysql-from-tf" {
    name = "mysql-from-tf"
    database_version = "POSTGRES_14"
    deletion_protection = false
    region = "us-central1"
  

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_user" "myuser" {
    name = "sami"
    password = "sami@1234"
    instance = google_sql_database_instance.mysql-from-tf.name
     
}
