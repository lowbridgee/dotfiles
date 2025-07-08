-- Basic settings
vim.opt.compatible = false
vim.opt.number = true
vim.opt.title = true
vim.opt.ambiwidth = "double"
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.list = true
vim.opt.listchars = {
  tab = "»-",
  trail = "-",
  eol = "↲",
  extends = "»",
  precedes = "«",
  nbsp = "%"
}
vim.opt.nrformats:remove("octal")
vim.opt.hidden = true
vim.opt.history = 50
vim.opt.virtualedit = "block"
vim.opt.whichwrap = "b,s,[,],<,>"
vim.opt.backspace = "indent,eol,start"
vim.opt.wildmenu = true
vim.opt.laststatus = 2

-- Syntax highlighting
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

-- Color scheme
vim.opt.background = "dark"
vim.cmd("autocmd ColorScheme * highlight LineNr ctermfg=228 guifg=#008800")

-- Language-specific settings
vim.cmd("au BufNewFile,BufRead *.scala setf scala")
vim.cmd("au BufNewFile,BufRead *.go setlocal tabstop=4 softtabstop=4 shiftwidth=4")
vim.cmd("au BufNewFile,BufRead *.md setf markdown")

-- vim-go settings
vim.g.go_fmt_command = "goimports"
vim.g.go_fmt_autosave = 1

-- Rust settings
vim.g.rustfmt_autosave = 1
vim.g.rustfmt_command = vim.env.HOME .. "/.cargo/bin/rustfmt"
vim.g.racer_cmd = vim.env.HOME .. "/.cargo/bin/racer"
vim.env.RUST_SRC_PATH = vim.env.HOME .. "/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"
vim.g.racer_experimental_completer = 1

-- Disable unused providers to reduce warnings
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Load global configuration if available
if vim.fn.filereadable("/etc/vim/vimrc.local") == 1 then
  vim.cmd("source /etc/vim/vimrc.local")
end