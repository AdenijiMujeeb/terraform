variable "project_id" {
  description = "Your GCP Project ID"
  default     = "lambda-377114"
  type        = string
}

variable "region" {
  description = "Region for GCP resources. Choose as per your location: https://cloud.google.com/about/locations"
  default     = "europe-west6"
  type        = string
}

variable "location" {
  description = "Region for GCP resources. Choose as per your location: https://cloud.google.com/about/locations"
  default     = "europe-west6"
  type        = string
}