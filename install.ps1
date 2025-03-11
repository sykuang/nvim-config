$SCRIPT_PATH = $MyInvocation.MyCommand.Path
$SCRIPT_FOLDER = Split-Path $SCRIPT_PATH -Parent
$NVCHAD_PATH = "$HOME\\AppData\\Local\\nvim"
$PSES_URL = "https://github.com/PowerShell/PowerShellEditorServices/releases/download/v4.2.0/PowerShellEditorServices.zip"
$PSES_ZIP = Join-Path $HOME "Downloads\PowerShellEditorServices.zip"
$PSES_FOLDER = Join-Path $HOME ".PSES"

# Check if it's running with Administrator privileges, if it's not, re-run the script with elevated privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$SCRIPT_PATH`"" -Verb RunAs
    exit
}

# Download and extract PowerShellEditorServices
if (-not (Test-Path $PSES_FOLDER)) {
    Invoke-WebRequest -Uri $PSES_URL -OutFile $PSES_ZIP
    Expand-Archive -Path $PSES_ZIP -DestinationPath  $PSES_FOLDER 
    Remove-Item $PSES_ZIP
}

New-Item -ItemType SymbolicLink -Path $NVCHAD_PATH -Target $SCRIPT_FOLDER\
