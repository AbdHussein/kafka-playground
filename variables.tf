locals {
  labels = {
    "data-project" = var.data-project
  }
}

variable "project" {
  type        = string
  description = "The project ID"
  default     = "dominica-294514"
}

variable "region" {
  type    = string
  default = "us-east1"
}

variable "data-project" {
  type        = string
  description = "Name of data pipeline project to use as resource prefix"
}
