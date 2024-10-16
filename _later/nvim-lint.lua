return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		-- https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
		lint.linters_by_ft = {
			terraform = { "tflint" },
			ansiblelint = { "ansible_lint" },
			bash = { "bash" },
			markdownlint = { "markdownlint" },
			tflint = { "tflint" },
			tfsec = { "tfsec" },
			yq = { "yq" },
			zsh = { "zsh" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
