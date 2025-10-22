## Configuration

1. Get [Monaspace Neon](https://github.com/githubnext/monaspace#monaspace) font.

1. Get [Ghostty](https://ghostty.org/download) and import [`config.ghostty`](config.ghostty).

1. On macOS:
    ```bash
    # Switch zsh to bash
    chsh -s /bin/bash

    # .bash_profile should exist, point it to .bashrc
    ln -s .bashrc .bash_profile
    ```

1. Get `.bashrc`.
    ```bash
    curl -fLo ~/.bashrc \
        https://raw.githubusercontent.com/anthhov/vim-config/refs/heads/master/.bashrc
    ```

1. Get `.gitconfig`:
    ```bash
    curl -fLo ~/.gitconfig \
        https://raw.githubusercontent.com/anthhov/vim-config/refs/heads/master/.gitconfig
    ```

1. Install tools:
   - [fzf](https://github.com/junegunn/fzf)
   - [ripgrep](https://github.com/BurntSushi/ripgrep)
   - [bat](https://github.com/sharkdp/bat)

1. Setup Vim:
    ```bash
    # Install vim-plug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # Get vim config
    curl -fLo ~/.vimrc \
        https://raw.githubusercontent.com/anthhov/vim-config/refs/heads/master/.vimrc

    # Install plugins
    vim +PlugInstall +qall
    ```
