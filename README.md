# Experimental: FastAPI + OpenTofu on Cloud Run

This repository is an **experimental sandbox** designed to test and demonstrate the deployment of a FastAPI application to Google Cloud Run using [OpenTofu](https://opentofu.org/) for Infrastructure as Code (IaC).

## 🚀 Purpose
The primary goal of this project is to explore:
- Automating GCP infrastructure with OpenTofu.
- Multi-environment (`dev` and `live`) CI/CD workflows using GitHub Actions.
- Seamless containerized deployment of FastAPI services.

---

## 💰 Current Status: Cost Saving Mode
> [!IMPORTANT]
> To minimize costs while this project is not actively being tested, the Cloud Run services in both `dev` and `live` environments have been **commented out** in the OpenTofu configuration.
> 
> The code remains intact, but the actual services are not currently deployed in GCP.

### How to Resume Deployment
To redeploy the services:
1. Uncomment the modules in `infra/iac/dev.tf` and `infra/iac/live.tf`.
2. Uncomment the outputs in `infra/iac/outputs.tf`.
3. Uncomment the deployment steps in `.github/workflows/deploy.yml`.
4. Push your changes to the `main` branch.

---

## 🛠 Tech Stack
- **Backend**: [FastAPI](https://fastapi.tiangolo.com/) (Python)
- **Infrastructure**: [OpenTofu](https://opentofu.org/)
- **Platform**: [Google Cloud Platform (GCP)](https://cloud.google.com/)
- **CI/CD**: [GitHub Actions](https://github.com/features/actions)
- **Containerization**: [Docker](https://www.docker.com/)

---

## 💻 Local Development

### Prerequisites
- Python 3.12+
- [uv](https://github.com/astral-sh/uv) (recommended for dependency management)

### Running the App
```bash
# Install dependencies
uv sync

# Run the FastAPI server
uv run fastapi dev app/main.py
```
The API will be available at `http://localhost:8000`.
