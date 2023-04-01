locals {
  project_id             = replace(var.project_id, "-", "_")
  data_lake_bucket       = "${local.project_id}_dt-lake"
  bigquery_dataset       = "${local.project_id}_bq_data"
  cloud_composer_enabled = 1
}

variable "project_name" {
  description = "Your GCP Project Name"
  default     = "tf_etl_spark"
  type        = string
}

variable "project_id" {
  description = "Your GCP Project ID"
  default     = "tf-etl-spark-360700"
  type        = string
}

variable "state_bucket" {
  description = "Bucket name for storing terrafrom state and lock files"
  default     = "tf_etl_spark__state"
  type        = string
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