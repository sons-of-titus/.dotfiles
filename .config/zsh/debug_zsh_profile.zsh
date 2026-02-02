#!/bin/zsh
zmodload zsh/datetime

echo "Profiling Zsh startup..."

measure() {
    local start=$EPOCHREALTIME
    if [ -f "$HOME/.config/zsh/$1" ]; then
        source "$HOME/.config/zsh/$1"
    else
        echo "File $1 not found"
    fi
    local end=$EPOCHREALTIME
    # Calculate duration in seconds with high precision
    local diff=$(( end - start ))
    printf "%-20s: %.4f seconds\n" "$1" "$diff"
}

cd "$HOME/.config/zsh" || exit 1

measure options.zsh
measure history.zsh
measure completion.zsh
measure prompt.zsh
measure env.zsh
measure aliases.zsh
measure functions.zsh
measure plugins.zsh

echo "Done."
