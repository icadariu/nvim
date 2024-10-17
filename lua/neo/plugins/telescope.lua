return { -- Fuzzy Finder (files, lsp, etc)
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      "nvim-telescope/telescope-fzf-native.nvim",

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = "make",

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    -- Enable Telescope extensions if they are installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    -- See `:help telescope.builtin`
    local builtin = require("telescope.builtin")
    local vkm = vim.keymap.set

    -- vim.keymap.set("n", "<Tab>f.", builtin.oldfiles, { desc = 'Find Recent Files ("." for repeat)' })
    vkm("n", "<Tab>fd", builtin.diagnostics, { desc = "Telescope - Find Diagnostics" })
    vkm("n", "<Tab>ff", builtin.find_files, { desc = "Telescope - Find Files" })
    vkm("n", "<Tab>fg", builtin.live_grep, { desc = "Telescope - Find live Grep" })
    vkm("n", "<Tab>fh", builtin.help_tags, { desc = "Telescope - Find Help" })
    vkm("n", "<Tab>fr", builtin.resume, { desc = "Telescope - Find Resume" })
    vkm("n", "<Tab>fs", builtin.builtin, { desc = "Telescope - Find builtin Telescope" })
    vkm("n", "<Tab>fw", builtin.grep_string, { desc = "Telescope - Find current word" })
    vkm("n", "<Tab>km", builtin.keymaps, { desc = "Telescope - Find Keymaps" })
    vkm("n", "<leader>.", builtin.oldfiles, { desc = "Telescope recent files" })
    vkm("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

    -- Grep for key in open files
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vkm("n", "<Tab>f/", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "Telescope - Find [/] in Open Files" })

    vkm("n", "<Tab>fn", function()
      -- Search for Neovim files in Neovim directory
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "Telescope - Find Neovim files in neovim dir." })
  end,
}
