-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  -- Plugin manager
  { "folke/lazy.nvim" },
  
  -- Syntax checking
  { "vim-syntastic/syntastic" },
  
  -- Color scheme
  { 
    "w0ng/vim-hybrid",
    config = function()
      vim.opt.background = "dark"
      vim.cmd("colorscheme hybrid")
    end
  },
  
  -- Status line
  { "itchyny/lightline.vim" },
  
  -- Auto close brackets
  { "Townk/vim-autoclose" },
  
  -- Markdown support
  { "godlygeek/tabular" },
  { 
    "plasticboy/vim-markdown",
    dependencies = { "tabular" }
  },
  
  -- Markdown preview
  { "kannokanno/previm" },
  
  -- Git integration
  { "tpope/vim-fugitive" },
  
  -- Language support
  { "derekwyatt/vim-scala" },
  { "fatih/vim-go" },
  { "rust-lang/rust.vim" },
  { "racer-rust/vim-racer" },
  { "rhysd/rust-doc.vim" },
  
  -- Unite and related (lazy loaded)
  { 
    "Shougo/unite.vim",
    cmd = "Unite"
  },
  { 
    "Shougo/neomru.vim",
    dependencies = { "unite.vim" }
  },
}, {
  -- Lazy.nvim configuration
  ui = {
    border = "rounded",
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})