#!/bin/zsh

# Load nvmrc file if found
load-nvmrc() {
    # get path to .nvmrc file
    local current_version="$(nvm version)"
    local nvmrc="$(nvm_find_nvmrc)"

    if [ -n "${nvmrc}" ]; then
        # get version from .nvmrc
        local nvmrc_version="$(nvm version `cat ${nvmrc}`)"

        # version is not installed.. so install duh
        if [ "${nvmrc_version}" = "N/A" ]; then
            nvm install
        fi

        # use that version
        nvm use
    elif [ "${current_version}" != "$(nvm version default)" ]; then
        # no .nvmrc file was found so use default if current version
        # is different
        nvm use default
    fi
}

add-zsh-hook chpwd load-nvmrc
