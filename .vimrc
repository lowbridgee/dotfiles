"Neobundle
if has('vim_starting')
  if &compatible
    set nocompatible
   endif
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

"---------------------------
" Start Neobundle Settings.
"---------------------------

"neobundle自体の取得
NeoBundleFetch 'Shougo/neobundle.vim'

"コード補完
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'marcus/rsense'
NeoBundle 'supermomonga/neocomplete-rsense.vim'

"ファイル構造可視化
NeoBundle 'scrooloose/nerdtree'

"ブロック終わりの補完
NeoBundle 'Townk/vim-autoclose'

"静的解析
NeoBundle 'scrooloose/syntastic.git'

"ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'

"メソッド定義元へのジャンプ
NeoBundle 'szw/vim-tags'

"自動で閉じる
NeoBundle 'tpope/vim-endwise'

call neobundle#end()

NeoBundleCheck

"------------------------
" End NeoBundle Settings.
"------------------------

" -------------------------------
" Rsense
" -------------------------------
let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseUseOmniFunc = 1

" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby ='[^.*\t]\.\w*\|\h\w*::'

" Required:
filetype plugin indent on

runtime! debian.vim

if has("syntax")
  syntax on
endif

set number
set title
set ambiwidth=double
set tabstop=2
set expandtab
set shiftwidth=2
set smartindent
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set nrformats-=octal
set hidden
set history=50
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set wildmenu
autocmd ColorScheme * highlight LineNr ctermfg=228 guifg=#008800
colorscheme hybrid

"Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
