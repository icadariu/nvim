# Troubleshooting Neovim

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
