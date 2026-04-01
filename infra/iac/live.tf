module "worker_live" {
  source       = "./modules/worker"
  service_name = "${var.service_name}-live"
  region       = var.region
  project_id   = var.project_id
  image        = "europe-west1-docker.pkg.dev/emphasaize/run-tofu-api-repo/run-tofu-api:66f5707f"
}

module "workflow_live" {
  source           = "./modules/workflow"
  workflow_name    = "run-tofu-workflow-live"
  region           = var.region
  project_id       = var.project_id
  workflow_version = "296c1f55"
  environment      = "live"
}
