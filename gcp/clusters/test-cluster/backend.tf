terraform {
  backend "gcs" {
    bucket = "dev-env-tinystacks"
    prefix = "terraform/state"
  }
}