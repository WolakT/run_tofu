variable "project_id" {
  description = "The Google Cloud Project ID"
  type        = string
  default     = "emphasaize"
}

variable "region" {
  description = "The GCP region to deploy resources to"
  type        = string
  default     = "europe-west1"
}

variable "github_repository" {
  description = "The GitHub repository to allow for Workload Identity Federation (format: owner/repo). Set this accurately so Github can deploy."
  type        = string
  default     = "wolakt/run_tofu"
}

variable "service_name" {
  description = "The name of the Cloud Run service"
  type        = string
  default     = "run-tofu-api"
}

variable "image" {
  description = "The container image to deploy. Defaults to a placeholder until overridden by GitHub Actions."
  type        = string
  default     = "us-docker.pkg.dev/cloudrun/container/hello"
}
