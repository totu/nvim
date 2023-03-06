-- require('telescope').setup {
--     defaults = {
--         vimgrep_arguments = "ignorecase",
--     }
-- }
local telescope = require('telescope')
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

-- I want to follow symbolic links
table.insert(vimgrep_arguments, "-L")

telescope.setup {
    defaults = {
		-- `hidden = true` is not supported in text grep commands.
		vimgrep_arguments = vimgrep_arguments,
	},

    pickers = {
        live_grep = {
            hidden = true,
            follow = true,
        },
        find_files = {
            hidden = true,
            follow = true,
        }
    }
}

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
vim.keymap.set("n", "<leader>b", builtin.buffers, {})
vim.keymap.set("n", "<leader>h", builtin.help_tags, {})
vim.keymap.set("n", "<leader>F", builtin.git_files, {})
