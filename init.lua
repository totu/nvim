-- packer stuff
require("plugins")

-- binds
vim.g.mapleader = " "
-- find robot definition
vim.keymap.set("v", "<F12>", "\"sy:Telescope live_grep<cr>i^<c-r>s<esc>0v$gu")
-- find robot usage
vim.keymap.set("v", "<F2>", "\"sy:Telescope live_grep<cr>i<c-r>s<esc>0v$gu")
-- because nvim devs suck (https://github.com/neovim/neovim/issues/416)
vim.keymap.set("n", "Y", "Y")
-- move line when visual
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")
-- stay on same line when J-ing
vim.keymap.set("n", "J", "mzJ`z")
-- go back to last buffer
vim.keymap.set("n", "<tab>", ":b#<cr>")
-- delete current buffer
vim.keymap.set("n", "<leader>d", ":bd<cr>")
-- robot shit
vim.keymap.set("i", "<C-space>", "<space><space><space><space>")
--vim.keymap.set("i", "<S-space>", "<space><space><space><space>")
vim.keymap.set("n", "<leader>j", ":%!python3 -m json.tool<CR>")
vim.keymap.set("n", "<leader>r", ":w<CR>:!robotidy %:p<CR>:e! %<CR><cr>")
vim.keymap.set("n", "<C-p>", ":!black %<cr><cr>")
vim.keymap.set("n", "<leader><space>", ":nohlsearch<CR>")

-- does this work over ssh?
vim.keymap.set("n", "<leader>y", "\"+y<cr>")
vim.keymap.set("x", "<leader>p", "\"_dP")

-- :sus:
vim.keymap.set("n", "<leader>m", function()
    vim.lsp.buf.format()
end)


-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    callback = function()
        vim.opt.relativenumber = false
    end
})
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    callback = function()
        vim.opt.relativenumber = true
    end
})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead" }, {
  pattern = { "dump", "*.dump", "*.out", "*.log.*", "dump.*" },
  command = ":set filetype=log"
})


-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- swap sux
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true

-- lol
vim.cmd("abbrev spadde spade")
vim.cmd("abbrev Commetn Comment")
vim.cmd("abbrev Comemtn Comment")

-- colors
vim.opt.termguicolors = true
function WTF(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
end

WTF()

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "100"

-- remove whitespaces on lines I touched
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.cmd("EnableStripWhitespaceOnSave")
    end
})



-- Bughunting and ops stuff, once you’ve gotten the hang of things.
-- The only “new” info you ever learn about a production system is that it is broken or,
-- even worse, that it is somehow managing to deliver value despite having the software equivalent
-- of hyperdimensional aggressive bone cancer.
-- Instead of merely not affording chances to learn or explore, this work actively punishes
-- you for digging into the abyss.
