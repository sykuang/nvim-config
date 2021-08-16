#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

REPO="https://github.com/siduck76/NvChad.git"
BACKUP_PATH="/tmp/nvchad/"
TMP_NVCHAD="/tmp/nvchad_updates/"

skip=0
nvchad_path="$HOME/.config/nvim/"
do_startup="true"
dependencies=(
    "git"
)
preserved_files=(
    "lua/mappings.lua"
    "lua/chadrc.lua"
)

# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
prompt() {
    case ${1} in
    "-s" | "--success")
        printf "${GREEN}%s${NC}\n" "${2}"
        ;;
    "-e" | "--error")
        printf "${RED}%s${NC}\n" "${2}"
        ;;
    "-w" | "--warning")
        printf "${ORANGE}%s${NC}\n" "${2}"
        ;;
    "-i" | "--info")
        printf "${BLUE}%s${NC}\n" "${2}"
        ;;
    *)
        printf "${GREEN}%s${NC}\n" "${2}"
        ;;
    esac
}

_usage() {
    printf "%s" \
        "Usage: ./${0##*/} [ options ]
    -h, --help          -> Show this help.
    -i, --install       -> Install the config.
    -r, --remove        -> Remove the config.
    -u, --update        -> Update the existing config without removing existing stuff.
    -s, --skip-startup  -> Skip starting up nvim after installing the config.
    -c, --clean-backups -> Remove backups (if any) from your system.
    -p=*, --path=*      -> Path to NvChad. Relevant for installing and updating.
"
}

_remove() {
	
	read -p "Are you sure you want to uninstall NvChad? This will 'flush' dirs such as $HOME/.config/nvim/. (y/n): " u_reply

	if [[ "${u_reply}" == "y" ]]; then
		printf "  + %s\n" "$(prompt -w "Removing config        ->	($HOME/.config/nvim/)")"
		rm -rf "$HOME/.config/nvim/"

		printf "  + %s\n" "$(prompt -w "Removing miscellaneous ->	($HOME/.local/share/nvim/)")"
		rm -rf "$HOME/.local/share/nvim/"

		printf "  + %s\n" "$(prompt -w "Removing cache         ->	($HOME/.cache/nvim/)")"
		rm -rf "$HOME/.cache/nvim/"
	elif [[ "${u_reply}" == "n" ]]; then
		prompt -i "Ok, enjoy NvChad :)"
	else
		prompt -e "Error: you must type either 'n' for no or 'y' for yes."
	fi

}

_check_dependencies() {
    local err

    for i in "${dependencies[@]}"; do

        if ! command -v "${i}" &>/dev/null; then
            prompt -e "Error: You need to install the dependency '${i}'"
            err="true"
        fi
    done

    if [[ "${err}" == "true" ]]; then
        exit 1
    fi
}


_check_prev_conf() {
    if [[ -d "${nvchad_path}" ]]; then
        mkdir -p "${BACKUP_PATH}"
        amount_files=$(ls "${BACKUP_PATH}" | wc -l)
        printf "  + %s\n" "$(prompt -i "Previous config found, backing it up (/tmp/nvchad/backup_${amount_files})")"
        cp -r "${nvchad_path}" "${BACKUP_PATH}backup_${amount_files}"
    fi
}

_check_nvim_version() {
    version_string="$(nvim --version | grep -Eo 'NVIM.*v[0-9.]+' -m 1 | grep -Eo '[0-9.]+')" || return 1
    printf "%s\n" "${version_string}" | while IFS=. read -r num1 num2 num3; do
        { [ "${num1}" -ge 0 ] && [ "${num2}" -ge 5 ] && [ "${num3}" -ge 0 ]; } || return 1
    done
}

_startup() {

    printf "  + %s\n" "$(prompt -i "Checking nvim version")"
    if _NVIM="$(command -v nvim)"; then
        if _check_nvim_version; then
            printf "  + %s\n" "$(prompt -i "NeoVim will open now")"
            sleep 1
            "${_NVIM}" +'autocmd User PackerComplete ++once lua print "Waiting for PackerCompile.." vim.cmd "PackerCompile"' \
                +'autocmd User PackerCompileDone ++once quitall' \
                +'lua print "Wait for PackerUpdate and PackerCompile to complete.." require "pluginList" vim.cmd "PackerUpdate"'
            "${_NVIM}"
        else
            prompt -e "Error: Neovim is installed, but version is lower than 0.5.x, install Neovim >= 5.x and then run nvim & do :PackerSync"
        fi
    else
        prompt -e "Error: Neovim is not installed, install Neovim >= 5.x and then run neovim & do :PackerSync"
    fi
}

_install() {
    prompt -w "-> Checking dependencies..."
    _check_dependencies
    prompt -w "-> Checking for previous confs..."
    _check_prev_conf
    prompt -w "-> Cloning..."

    if [[ "$do_startup" == "true" ]]; then
        prompt -w "-> Loading nvim..."
        _startup
    fi
}

_install
