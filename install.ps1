$SCRIPT_PATH = $MyInvocation.MyCommand.Path
$SCRIPT_FOLDER = Split-Path $SCRIPT_PATH -Parent
$NVCHAD_PATH = "$HOME\\AppData\\Local\\nvim"

New-Item -ItemType SymbolicLink -Path $NVCHAD_PATH -Target $SCRIPT_FOLDER\
