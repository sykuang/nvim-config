$SCRIPT_PATH = $MyInvocation.MyCommand.Path
$SCRIPT_FOLDER = Split-Path $SCRIPT_PATH -Parent
$NVCHAD_PATH = "$HOME\\AppData\\Local\\nvim"

git clone https://github.com/NvChad/NvChad $NVCHAD_PATH --depth 1 --branch v2.0
New-Item -ItemType SymbolicLink -Path $NVCHAD_PATH\lua\custom -Target $SCRIPT_FOLDER\custom\
