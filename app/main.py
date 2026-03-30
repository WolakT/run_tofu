from fastapi import FastAPI
import os

app = FastAPI(title="Run Tofu FastAPI Service")

@app.get("/")
def read_root():
    # Example to prove the service is running optionally reading from an env variable
    project_env = os.getenv("GOOGLE_CLOUD_PROJECT", "unknown")
    return {
        "message": "Hello from OpenTofu deployed Cloud Run!",
        "project": project_env
    }

@app.get("/health")
def read_health():
    return {"status": "ok"}
