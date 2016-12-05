let [plugins, ftplugin] = dein#load_cache_raw(['/Users/Lowbridge/.vimrc'], 1)
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/Lowbridge/dotfiles/dein'
let g:dein#_runtime_path = '/Users/Lowbridge/dotfiles/dein/.dein'
let &runtimepath = '/Users/Lowbridge/dotfiles/dein/repos/github.com/Shougo/dein.vim,/Users/Lowbridge/.vim,/Users/Lowbridge/dotfiles/dein/.dein,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim74,/usr/local/share/vim/vimfiles/after,/Users/Lowbridge/.vim/after,/Users/Lowbridge/dotfiles/dein/.dein/after'
  set background=dark
  let g:acp_enableAtStartup = 0
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_omni_input_patterns.ruby ='[^.*\t]\.\w*\|\h\w*::'
autocmd dein-events InsertEnter * call dein#autoload#_on_event("InsertEnter", ['neocomplete.vim'])
