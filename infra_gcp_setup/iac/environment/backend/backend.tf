terraform {
 backend "gcs" {
   bucket  = "tfstate-data-bkt"
   prefix  = "terraform/state"
 }
}