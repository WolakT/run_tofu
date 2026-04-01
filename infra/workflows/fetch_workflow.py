import subprocess
import sys
import json
import os

# Get the directory where the script is located
SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
# Repo root is one level up from infra/workflows/
REPO_ROOT = os.path.abspath(os.path.join(SCRIPT_DIR, "../../"))

def get_git_content(sha, relative_path):
    # The actual file on disk
    full_path = os.path.join(REPO_ROOT, relative_path)
    try:
        if sha == "latest" or sha == "current":
            with open(full_path, 'r') as f:
                return f.read()
        # For git show, we use the relative path from repo root
        return subprocess.check_output(['git', 'show', f'{sha}:{relative_path}'], cwd=REPO_ROOT, stderr=subprocess.PIPE).decode('utf-8')
    except Exception as e:
        # Fallback to local file if SHA not found (useful for local testing)
        if os.path.exists(full_path):
            with open(full_path, 'r') as f:
                return f.read()
        raise Exception(f"Failed to fetch {relative_path} at SHA {sha}. Error: {str(e)}")

def main():
    if len(sys.argv) < 3:
        print(json.dumps({"error": "Usage: fetch_workflow.py <SHA> <ENV>"}))
        sys.exit(1)

    sha = sys.argv[1]
    env = sys.argv[2]
    
    workflow_rel_path = "infra/workflows/workflow.yaml"
    config_rel_path = "infra/workflows/config.json"

    try:
        workflow_content = get_git_content(sha, workflow_rel_path)
        config_content = get_git_content(sha, config_rel_path)
        
        # Inject environment variable into config
        config_content = config_content.replace("${ENVIRONMENT}", env)
        
        # In this implementation, we just return the raw content and the config.
        # The workflow logic can decide how to use the config (e.g. passed at runtime).
        print(json.dumps({"source_contents": workflow_content, "config": config_content}))
    except Exception as e:
        # Crucial: return a JSON error so Terraform data "external" can report it
        print(json.dumps({"error": str(e)}))
        sys.exit(1)

if __name__ == "__main__":
    main()
