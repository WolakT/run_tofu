output "dev_service_url" {
  value = module.worker_dev.service_url
}

output "live_service_url" {
  value = module.worker_live.service_url
}

output "workload_identity_provider" {
  value = google_iam_workload_identity_pool_provider.github_provider.name
}

output "service_account_email" {
  value = google_service_account.github_actions_sa.email
}

output "artifact_registry_repo" {
  value = google_artifact_registry_repository.repo.name
}
