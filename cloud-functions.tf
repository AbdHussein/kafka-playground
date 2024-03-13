resource "google_cloudfunctions_function" "function" {
  name        = "${var.data-project}-function"
  description = "a sample cloud founction created by terraform"
  runtime     = "nodejs16"

  available_memory_mb = 128
  trigger_http        = true
  entry_point         = "helloGET"
}

# IAM entry for all users to invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
