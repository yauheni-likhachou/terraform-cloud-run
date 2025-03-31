provider "google" {
  project = var.project_id
  region  = var.region
  credentials = file("~/<sample-flask-app-XXXX.json") # currently used ~/sample-flask-app-455114-56d77f2b75f6.json
}

#

# Deploy the sample application to Cloud Run
resource "google_cloud_run_service" "app_service" {
  name     = "sample-cloud-run-app"
  location = var.region

  # Define container details
  template {
    spec {
      containers {
        # Use the public Docker Hub image
        image = "yalikhach/sample-flask-app:0.1"


        env {
          name  = "ENV_VAR"
          value = "Hello, GCP!"
        }
      }
    }
  }

  # Routing traffic rules
  traffic {
    percent         = 100
    latest_revision = true
  }

  autogenerate_revision_name = true
}

# Allow public access to the Cloud Run service
resource "google_cloud_run_service_iam_policy" "public_access_policy" {
  location = google_cloud_run_service.app_service.location
  service  = google_cloud_run_service.app_service.name

  policy_data = <<EOT
{
  "bindings": [
    {
      "role": "roles/run.invoker",
      "members": [
        "allUsers"
      ]
    }
  ]
}
EOT
  depends_on = [google_cloud_run_service.app_service]
}