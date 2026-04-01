variable "workflow_name" {
  type = string
}

variable "region" {
  type = string
}

variable "project_id" {
  type = string
}

variable "workflow_version" {
  type = string
}

variable "environment" {
  type = string
}

data "external" "workflow_data" {
  program = ["python3", "${path.module}/../../../infra/workflows/fetch_workflow.py", var.workflow_version, var.environment]
}

resource "google_workflows_workflow" "default" {
  name            = var.workflow_name
  region          = var.region
  project         = var.project_id
  description     = "GCP Workflow for ${var.environment} (version: ${var.workflow_version})"
  source_contents = data.external.workflow_data.result.source_contents
}

output "workflow_id" {
  value = google_workflows_workflow.default.id
}
