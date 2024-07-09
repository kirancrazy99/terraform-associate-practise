terraform {
  backend "gcs" {
    bucket  = "terraform-practice-428705-tf-state"
    prefix  = "chap02/backend"    
  }
}