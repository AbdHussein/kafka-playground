
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

data "google_compute_zones" "this" {
  region  = var.region
  project = var.project
}

locals {
  type  = ["public", "private"]
  zones = data.google_compute_zones.this.names
}

# VPC
resource "google_compute_network" "this" {
  name                            = "${var.project}-vpc"
  delete_default_routes_on_create = false
  auto_create_subnetworks         = false
  routing_mode                    = "REGIONAL"
}
