"---------------------------
" Start Neobundle Settings.
"---------------------------
"bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
 
"Required:
call neobundle#begin(expand('~/.vim/bundle/'))
  
"neobundle自体の取得
NeoBundleFetch 'Shougo/neobundle.vim'

"プラグインのインストール
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Townk/vim-autoclose'

"プラグイン コード補完
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle "osyo-manga/vim-monster" 

"静的解析
NeoBundle 'scrooloose/syntastic'

"ctags設定
NeoBundle 'szw/vim-tags'
let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -R {OPTIONS} {DIRECTORY} 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R {OPTIONS} `bundle show --paths` 2>/dev/null"

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------

" Use neocomplete.vim
let g:neocomplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}

runtime! debian.vim

if has("syntax")
  syntax on
endif

set number
set title
set ambiwidth=double
set tabstop=4
set expandtab
set shiftwidth=4
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

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
