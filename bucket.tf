resource "google_storage_bucket" "Cloud_function_bucket" {
  name     = "Cloud-function-${var.project}"
  location = var.region
  project  = var.project
}

resource "google_storage_bucket" "input_bucket" {
  name     = "input-${var.project}"
  location = var.region
  project  = var.project
}