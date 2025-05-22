#!/bin/bash
set +e  # Disable immediate exit on error

run_step() {
    echo "Running: $1"
    bash -c "$1"
    if [ $? -ne 0 ]; then
        echo "⚠️  Failed: $1"
    fi
}

run_step "scripts/install_homebrew.sh"
run_step "scripts/install_omz.sh"

# echo "Git config"
run_step 'git config --global user.name "Ole Magnus Lie"'
run_step 'git config --global user.email lieolemagnus@gmail.com'

echo "Symlinking dotfiles"
run_step "./symlink-dotfiles.sh"

echo "Setting ZSH as shell..."
chsh -s /bin/zsh || echo "⚠️  Failed to change shell"
source ~/.zshrc || echo "⚠️  Failed to source .zshrc"

run_step "./scripts/set_mac_settings.sh"

echo "✅ Done!"
