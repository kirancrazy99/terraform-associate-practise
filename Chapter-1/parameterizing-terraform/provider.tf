provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
  credentials = "c:\\Users\\kiran\\terraform.json"
}