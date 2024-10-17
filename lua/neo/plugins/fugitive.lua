return {
  "tpope/vim-fugitive",
  config = function()
    -- Create an autocommand group for fugitive
    local ThePrimeagen_Fugitive = vim.api.nvim_create_augroup("ThePrimeagen_Fugitive", {})

    local autocmd = vim.api.nvim_create_autocmd
    autocmd("BufWinEnter", {
      group = ThePrimeagen_Fugitive,
      pattern = "*",
      callback = function()
        if vim.bo.ft ~= "fugitive" then
          return
        end
      end,
    })
  end
}
