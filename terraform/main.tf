provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_service_account" "cloud_run_sa" {
  account_id   = "${var.service_name}-sa"
  display_name = "Cloud Run Service Account for ${var.service_name}"
}

resource "google_project_iam_binding" "cloud_run_invoker_binding" {
  project = var.project_id
  role    = "roles/run.invoker"
  members = [
    "allUsers", # Makes the Cloud Run Service public
  ]
}

resource "google_cloud_run_service" "service" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.docker_image

        resources {
          limits = {
            memory = "512Mi"
            cpu    = "1"
          }
        }
      }
    }
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale" = "2"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  depends_on = [google_project_iam_binding.cloud_run_invoker_binding]
}

output "cloud_run_url" {
  value       = google_cloud_run_service.service.status[0].url
  description = "The URL for the deployed Cloud Run service"
}