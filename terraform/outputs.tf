output "cloud_run_service_url" {
  description = "The URL to access your Cloud Run application"
  value       = google_cloud_run_service.app_service.status[0].url
}