-- Set leader key
vim.g.mapleader = " "

-- Rust keymaps
vim.cmd("au FileType rust nmap gd <Plug>(rust-def)")
vim.cmd("au FileType rust nmap gs <Plug>(rust-def-split)")
vim.cmd("au FileType rust nmap gx <Plug>(rust-def-vertical)")
vim.cmd("au FileType rust nmap <leader>gd <Plug>(rust-doc)")