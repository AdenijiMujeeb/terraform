locals {
  project_id             = replace(var.project_id, "-", "_")
  cloud_composer_enabled = 1
}

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

variable "pool_id" {
  type        = string
  description = "Workload Identity Pool ID"
  default     = "lambda-pool"
}

variable "provider_id" {
  type        = string
  description = "Workload Identity Pool Provider id"
  default     = "gh-oidc-provider"
}

variable "attribute_mapping" {
  type        = map(any)
  description = "Workload Identity Pool Provider attribute mapping. [More info](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider#attribute_mapping)"
  default     = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
    "attribute.full"       = "assertion.repository+assertion.ref"
  }
}