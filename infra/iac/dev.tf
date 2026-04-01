# module "worker_dev" {
#   source       = "./modules/worker"
#   service_name = "${var.service_name}-dev"
#   region       = var.region
#   project_id   = var.project_id
#   image        = "europe-west1-docker.pkg.dev/emphasaize/run-tofu-api-repo/run-tofu-api:e2feee3c"
# }

module "workflow_dev" {
  source           = "./modules/workflow"
  workflow_name    = "run-tofu-workflow-dev"
  region           = var.region
  project_id       = var.project_id
  workflow_version = "296c1f55"
  environment      = "dev"
}
