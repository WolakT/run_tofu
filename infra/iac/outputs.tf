output "service_url" {
  value = google_cloud_run_v2_service.api.uri
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
