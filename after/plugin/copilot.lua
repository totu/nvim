vim.g.copilot_no_tab_map = true
vim.cmd("imap <silent><script><expr> <f1> copilot#Accept(\"\\<CR>\")")
vim.keymap.set("i", "<f6>", "<Plug>(copilot-next)")
vim.keymap.set("i", "<f5>", "<Plug>(copilot-previous)")
