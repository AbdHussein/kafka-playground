
terraform {
  backend "gcs" {
    bucket = "terraform-state-cicd-github"
    prefix = ""
  }
}

provider "google" {
  project = var.project
  region  = var.region
}

# An example resource that does nothing.
resource "null_resource" "example" {
  triggers = {
    value = "A example resource that does nothing!"
  }
}
