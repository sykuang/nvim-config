$SCRIPT_PATH = $MyInvocation.MyCommand.Path
$SCRIPT_FOLDER = Split-Path $SCRIPT_PATH -Parent
$NVCHAD_PATH = "$HOME\\AppData\\Local\\nvim"

# Check if it's running with Administrator privileges, if it's not, re-run the script with elevated privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$SCRIPT_PATH`"" -Verb RunAs
    exit
}

New-Item -ItemType SymbolicLink -Path $NVCHAD_PATH -Target $SCRIPT_FOLDER\
