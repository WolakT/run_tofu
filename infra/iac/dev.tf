module "worker_dev" {
  source       = "./modules/worker"
  service_name = "${var.service_name}-dev"
  region       = var.region
  project_id   = var.project_id
  image        = "europe-west1-docker.pkg.dev/emphasaize/run-tofu-api-repo/run-tofu-api@sha256:9ea1f3097ea570b037b0c6df92cb09feabfdaa3516ebb0d2ed64e72e08290bf6"
}
