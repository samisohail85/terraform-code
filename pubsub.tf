resource "google_pubsub_topic" "topic_tf" {
  name = "topic_tf"
  
}

resource "google_pubsub_subscription" "sub-tf" {
  name = "sub_tf"
  topic = google_pubsub_topic.topic_tf.name
  
}
