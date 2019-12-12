#!/usr/bin/env sh
# Profile file. Runs on login

# Adds '~/.local/bin' and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export EDITOR="vim"
export TERMINAL="urxvt"
export BROWSER="google-chrome-stable"
export FILE="ranger"
export SUDO_ASKPASS="$HOME/.local/bin/tools/menupass"
