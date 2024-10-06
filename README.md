# My custom Neovim config

* This is still WIP since it lacks LSP integration and some other nice to have plugins.

## Neovim links

### Neovim configs

* <https://github.com/exosyphon/nvim>
  * <https://www.youtube.com/watch?v=2Meztidjjlg>
* <https://dotfyle.com/neovim/plugins/top>
* <https://dotfyle.com/neovim/configurations/top>
* <https://github.com/typecraft-dev/dotfiles>
* <https://github.com/vieko/.dotfiles>
  * <https://github.com/vieko/init.lua/tree/d2a2f0f5fc38d3f0450bb5ce033c554f904bc45f>
* <https://github.com/adelowo/dotfiles/tree/master/nvim>
* <https://github.com/dreamsofcode-io/neovim-go-config>
* <https://github.com/ThePrimeagen/init.lua>
* <https://github.com/tjdevries/config.nvim>
* <https://github.com/joshuamorony/nvim>

### Yt clips about Nevim

* [tree-sitter explained](https://www.youtube.com/watch?v=09-9LltqWLY)
* [simple neovim debugging setup (in 10 minutes)](https://youtu.be/lyNfnI-B640)
* [Neovim note taking](https://youtu.be/5wy2iLU5fs0?t=51)
  * <https://github.com/joshuamorony/nvim>
  * <https://github.com/joshuamorony/go-in/>

### Other

* <https://dotfyle.com/neovim/colorscheme/trending>

## Troubleshooting Neovim

* Find key issues

  ```lua
  -- The best so far is to use namp. Let's say i want to find out about Ctrl+J
  -- either go verbose mode
  :verbose nmap <C-j>

  -- or regular
  :nmap <C-j>
  ```

* <https://www.youtube.com/watch?v=lyNfnI-B640>
* Activating debug mode:

  ```vim
  :set verbosefile=~/.config/nvim/nvim.log
  :set verbose=3
  ```

* `Why my values got changed?`

  ```markdown
  *  Let's say we have shiftwidth tabstop softtabstop set to 2
  * We can check this by using
  `:set shiftwidth? tabstop? softtabstop? expandtab?`
  ```

  * While editing a markdown file, these have been changed to 4.
  * To find out what happend, run:

    ```vim
    :verbose set expandtab?
    Last set from /opt/nvim-linux64/share/nvim/runtime/ftplugin/markdown.vim line 26
    ```

  * To fix it, i have created this in my set.lua file

    ```lua
    -- makrdown filetype changes indentation
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.bo.shiftwidth = 2
        vim.bo.tabstop = 2
        vim.bo.softtabstop = 2
        vim.bo.expandtab = true
      end,
    })
    ```

## Other stuff

* What is the difference between `nmap` and `map` when talking about keys
  * A: `nmap` - normal mode (type/delete/etc); `map` - they key is active in all modes
  * All the modes are below:

    ```md
    `vmap`: For visual mode.
    `imap`: For insert mode.
    `omap`: For operator-pending mode.
    `xmap`: For visual block mode.
    ```
