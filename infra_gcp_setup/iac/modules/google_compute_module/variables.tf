locals {
  instance_name = "${var.project_id}-vm"
}

variable "project_id" {
  description = "Your GCP Project ID"
   default     = "lambda-377114"
  type        = string
}

variable "company" { 
        default = "bayes"
    }
    
variable "subnet" {
        default = "10.0.1.0/24"
    }

variable "region" {
  description = "Region for GCP resources. Choose as per your location: https://cloud.google.com/about/locations"
  default     = "europe-west6"
  type        = string
}

variable "storage_class" {
  description = "Storage class type for your bucket. Check official docs for more info."
  default     = "STANDARD"
  type        = string
}
