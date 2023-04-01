output "composer_enabled" {
  description = "composer uri and project id."
  value       = google_project_service.cloud-composer
}

output "composer_iamcredentials" {
  description = "composer authenication."
  value       = google_project_service.iamcredentials
}
