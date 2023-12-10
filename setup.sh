#!/bin/bash

[[ -e ~/.bashrc ]] && echo '[ -s "${PWD}/project-setup.sh" ] && source "${PWD}/project-setup.sh"' >> ~/.bashrc
[[ -e ~/.zshrc ]] && echo '[ -s "${PWD}/project-setup.sh" ] && source "${PWD}/project-setup.sh"' >> ~/.zshrc
