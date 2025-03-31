variable "project_id" {
  description = "Project id"
  type        = string
  default = "sample-flask-app-455114"
}

variable "region" {
  description = "The GCP region where resources will be deployed"
  type        = string
  default     = "us-central1" # Default region
}

variable "docker_image" {
  description = "The Docker image to be deployed from Docker Hub"
  type        = string
  default     = "yalikhach/sample-flask-app:latest"
}

variable "service_name" {
  description = "The name of the Cloud Run service"
  type        = string
  default     = "sample-flask-app"
}