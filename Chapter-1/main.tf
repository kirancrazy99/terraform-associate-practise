provider "google" {
  project = var.project_id
  region = "us-central1"
  zone = "us-central1-a"
}

variable "project_id" {
    type = string
    default = "terraform-practice-428705"
  
}

resource "google_compute_instance" "this" {
  name = "cloudshell"
  machine_type = "e2-small"
  zone = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
    network_interface {
        network = "default"
        }
}