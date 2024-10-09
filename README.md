# My custom Neovim config

* This is still WIP since it lacks LSP integration and some other nice to have plugins.
* Ispired from:
  * <https://github.com/jdhao/nvim-config/>
  * <https://github.com/ThePrimeagen/init.lua/>
  * <https://github.com/nvim-lua/kickstart.nvim>

## Requirements

* Node

  ```sh
  # Ref: https://johnpapa.net/node-and-npm-without-sudo/
  # https://nodejs.org/en/download/prebuilt-binaries
  node_version='v22.9.0'

  mkdir -p $HOME/tools && cd $HOME/tools

  wget https://nodejs.org/dist/${node_version}/node-${node_version}-linux-x64.tar.xz
  # extract node to a custom directory, the directory should exist.
  tar xvf node-${node_version}-linux-x64.tar.xz --directory=$HOME/tools

  # add node path in .zshrc
  export PATH="$HOME/tools/node-${ndoe_version}-linux-x64/bin:$PATH"

  mkdir -p $HOME/.npm-packages
  npm config set prefix ~/.npm-packages
  ```

  * vim languageserver

    ```sh
    npm install -g vim-language-server
    npm install -g bash-language-server
    ```

* Python related

  ```sh
  python3 -m venv ~/.venv
  . ~/.venv/bin/activate

  pip install -U pynvim
  pip install 'python-lsp-server[all]' pylsp-mypy python-lsp-isort python-lsp-black
  ```

* Ripgrep

```sh
sudo apt update && sudo apt install ripgrep
```
