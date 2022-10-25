provider "google" {
  project     = "dev-env-360508"
  region      = "us-central1"
}

resource "google_project_service" "services" {
  for_each = toset(var.services)
  service  = each.value
}