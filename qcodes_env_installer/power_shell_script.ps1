$ErrorActionPreference = "Stop"

$ENV_NAME = "qcodes_auto"

Write-Host "=== QCoDeS + Labber environment installer ==="

# Ensure micromamba exists
if (-not (Get-Command micromamba -ErrorAction SilentlyContinue)) {
    Write-Error "micromamba not found in PATH. Please install micromamba first."
}

Write-Host "Creating micromamba environment..."
if (Test-Path "conda-lock.win-64.yml") {
    Write-Host "Using locked environment"
    micromamba create -n $ENV_NAME -f conda-lock.yml --yes
} else {
    Write-Host "Using conda_reqs.yml (no lockfile found)"
    micromamba create -n $ENV_NAME -f conda_reqs.yml --yes
}

Write-Host "Activating environment..."
micromamba activate $ENV_NAME

Write-Host "Installing pip dependencies..."
pip install -r pip_reqs.txt

Write-Host "Checking Labber include folder compatibility..."

$pythonVersion = python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')"
$pythonVersion = $pythonVersion.Trim()

$expectedInclude = "_include" + ($pythonVersion -replace '\.', '')

if (-not (Test-Path "Labber\$expectedInclude")) {
    Write-Error "Labber does not contain $expectedInclude. Python version mismatch."
}

Write-Host "Installing Labber (editable, no-deps)..."
pip install -e . --no-deps

Write-Host "Running sanity check..."
python -c "import Labber, qcodes, pyvisa; print('All imports OK')"

Write-Host ""
Write-Host "Installation complete!"
Write-Host "Activate later with: micromamba activate $ENV_NAME"