#!/bin/bash

# Definisci il percorso dello script di configurazione
CONFIG_SCRIPT="${PWD}/project-setup.sh"

# Aggiungi la riga ai file di configurazione della shell se non esiste già
add_source_line() {
    local rcfile="$1"
    local line="[ -s \"$CONFIG_SCRIPT\" ] && source \"$CONFIG_SCRIPT\""
    
    # Controlla se il file di configurazione esiste
    if [[ -e "$rcfile" ]]; then
        # Controlla se la riga è già presente nel file
        if ! grep -Fxq "$line" "$rcfile"; then
            echo "$line" >> "$rcfile"
        fi
    fi
}

# Aggiungi la riga a .bashrc e .zshrc
add_source_line "${HOME}/.bashrc"
add_source_line "${HOME}/.zshrc"