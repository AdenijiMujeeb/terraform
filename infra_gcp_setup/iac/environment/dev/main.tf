module "oidc" {
  source      = "../../modules/gh_oidc_module"
  project_id  = var.project_id
  pool_id     = var.pool_id
  provider_id = var.provider_id

}

# # Google Compute Engine: VM
# # Ref: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
# module "vm_service" {
#   source = "../../modules/google_compute_module"
# }

# # Cloud Composer Environment
# # Ref: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/composer_environment
# module "cloud-composer" {
#   source     = "../../modules/cloud_composer_module"
#   count      = local.cloud_composer_enabled
#   project_id = local.project_id
#   region     = var.region
# }

# Data ware house : DWH
# Ref: https://registry,.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset
module "bq_dataset" {
  source = "../../modules/bq_warehouse_module"
}