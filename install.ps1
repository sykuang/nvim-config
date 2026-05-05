$REPO_URL = "https://github.com/sykuang/nvim-config.git"
$REMOTE_SCRIPT_URL = "https://raw.githubusercontent.com/sykuang/nvim-config/main/install.ps1"
$DEFAULT_CLONE_PATH = Join-Path $HOME "nvim-config"
$NVCHAD_PATH = "$HOME\AppData\Local\nvim"
$PSES_URL = "https://github.com/PowerShell/PowerShellEditorServices/releases/download/v4.2.0/PowerShellEditorServices.zip"
$PSES_ZIP = Join-Path $HOME "Downloads\PowerShellEditorServices.zip"
$PSES_FOLDER = Join-Path $HOME ".PSES"

$SCRIPT_PATH = $MyInvocation.MyCommand.Path
if ($SCRIPT_PATH) {
    $SCRIPT_FOLDER = Split-Path $SCRIPT_PATH -Parent
} else {
    # Running remotely (e.g. via `irm <url> | iex`). Clone the repo to a default location.
    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        Write-Error "git is required to install from a remote URL. Please install git and retry."
        exit 1
    }
    if (-not (Test-Path $DEFAULT_CLONE_PATH)) {
        Write-Host "Cloning $REPO_URL to $DEFAULT_CLONE_PATH"
        git clone $REPO_URL $DEFAULT_CLONE_PATH
        if ($LASTEXITCODE -ne 0) {
            Write-Error "Failed to clone $REPO_URL"
            exit 1
        }
    } else {
        Write-Host "Repository already exists at $DEFAULT_CLONE_PATH, skipping clone."
    }
    $SCRIPT_FOLDER = $DEFAULT_CLONE_PATH
    $SCRIPT_PATH = Join-Path $SCRIPT_FOLDER "install.ps1"
}

# Check if it's running with Administrator privileges, if it's not, re-run the script with elevated privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
    if (Test-Path $SCRIPT_PATH) {
        Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$SCRIPT_PATH`"" -Verb RunAs -Wait
    } else {
        Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"iwr $REMOTE_SCRIPT_URL -UseBasicParsing | iex`"" -Verb RunAs -Wait
    }
    exit
}

# Download and extract PowerShellEditorServices
if (-not (Test-Path $PSES_FOLDER)) {
    Invoke-WebRequest -Uri $PSES_URL -OutFile $PSES_ZIP
    Expand-Archive -Path $PSES_ZIP -DestinationPath  $PSES_FOLDER
    Remove-Item $PSES_ZIP
}

if (-not (Test-Path $NVCHAD_PATH)) {
    New-Item -ItemType SymbolicLink -Path $NVCHAD_PATH -Target "$SCRIPT_FOLDER\" | Out-Null
} else {
    Write-Host "$NVCHAD_PATH already exists, skipping symlink creation."
}
