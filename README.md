# nvim-config

Personal Neovim configuration.

## Installation

### Windows (PowerShell)

Run the installer directly from GitHub (requires `git` to be installed):

```powershell
irm https://raw.githubusercontent.com/sykuang/nvim-config/main/install.ps1 | iex
```

The script will:

1. Clone this repository to `$HOME\nvim-config` (if not already present).
2. Re-launch itself with Administrator privileges (required for the symlink).
3. Download PowerShellEditorServices to `$HOME\.PSES`.
4. Create a symbolic link from `$HOME\AppData\Local\nvim` to the cloned repo.

Alternatively, clone the repo first and run the script locally:

```powershell
git clone https://github.com/sykuang/nvim-config.git $HOME\nvim-config
& $HOME\nvim-config\install.ps1
```

### Linux / macOS

Run the installer directly from GitHub (requires `git` to be installed):

```bash
curl -fsSL https://raw.githubusercontent.com/sykuang/nvim-config/main/install.sh | bash
```

Or clone the repo first and run the script locally:

```bash
git clone https://github.com/sykuang/nvim-config.git ~/nvim-config
~/nvim-config/install.sh
```
