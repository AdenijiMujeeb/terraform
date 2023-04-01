output "bq_view" {
  description = "Map of bigquery view resources being provisioned."
  value       = google_service_account.bqowner 
}