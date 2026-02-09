$ErrorActionPreference = "Stop"

$ENV_NAME = "plottr_auto"

Write-Host "=== plottr installer ==="

# Ensure micromamba exists
if (-not (Get-Command micromamba -ErrorAction SilentlyContinue)) {
    Write-Error "micromamba not found in PATH. Please install micromamba first."
}

Write-Host "Creating micromamba environment..."

micromamba create -n $ENV_NAME -f plottr.yaml --yes


Write-Host "Installation complete!"
Write-Host "Activate later with: micromamba activate $ENV_NAME"