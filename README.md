# Yet another NeoVim config

* This setup is inspired from multiple sources like:
  * [kickstart project](https://github.com/nvim-lua/kickstart.nvim)
  * [LazyVim](https://www.lazyvim.org/configuration/)
  * [The Primeagen init.lua](https://github.com/ThePrimeagen/init.lua/)
  * [vmarlier dotfiles](https://github.com/vmarlier/dotfiles/tree/master/nvim)
  * [grepm11n](https://github.com/grem11n/dotfiles/tree/master/config/nvim)
  * [bshephar lazy](https://github.com/bshephar/lazyvim-config)

* Check `docs` folder for different tips & tricks.

## Installation

### External Dependencies

* Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
* [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
* Clipboard tool (xclip/xsel/win32yank or other depending on platform)
* A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
* Language Setup:
  * If you want to write Typescript, you need `npm`
  * If you want to write Golang, you will need `go`

* You likely want to remove `lazy-lock.json` from your fork's `.gitignore` file
too - it's ignored in the kickstart repo to make maintenance easier, but it's
[recommmended to track it in version control](https://lazy.folke.io/usage/lockfile).

### Getting Started

[The Only Video You Need to Get Started with Neovim](https://youtu.be/m8C0Cq9Uv9o)

### FAQ

* What should I do if I already have a pre-existing neovim configuration?
  * You should back it up and then delete all associated files.
  * This includes your existing init.lua and the neovim files in `~/.local`
    which can be deleted with `rm -rf ~/.local/share/nvim/`
* Can I keep my existing configuration in parallel to kickstart?
  * Yes! You can use [NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME)`=nvim-NAME`
    to maintain multiple configurations. For example, you can install the kickstart
    configuration in `~/.config/nvim-kickstart` and create an alias:

    ```sh
    alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'
    ```

    When you run Neovim using `nvim-kickstart` alias it will use the alternative
    config directory and the matching local directory
    `~/.local/share/nvim-kickstart`. You can apply this approach to any Neovim
    distribution that you would like to try out.

* What if I want to "uninstall" this configuration:
  * See [lazy.nvim uninstall](https://lazy.folke.io/usage#-uninstalling) information

#### Linux Install

```sh
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip curl

# Now we install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim-linux64
sudo mkdir -p /opt/nvim-linux64
sudo chmod a+rX /opt/nvim-linux64
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# make it available in /usr/local/bin, distro installs to /usr/bin
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/
```
