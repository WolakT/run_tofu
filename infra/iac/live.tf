module "worker_live" {
  source       = "./modules/worker"
  service_name = "${var.service_name}-live"
  region       = var.region
  project_id   = var.project_id
  image        = "europe-west1-docker.pkg.dev/emphasaize/run-tofu-api-repo/run-tofu-api:e2feee3c"
}
