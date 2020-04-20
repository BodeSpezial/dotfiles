syntax on "sytnax highlighting

set number "show line numbers
set autoindent "activate autoindent
set encoding=UTF-8 "set encoding to utf-8 for devicons

set expandtab "use_spaces_instead_of_tabs
"set listchars=space:_,tab:>~ list
set tabstop=4 "set tabsize to 4
set backspace=indent,eol,start "enable backspace
"disable arrow keys to teach hjkl
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set vb t_vb= "disable beep and flash

"autocmds
"execute save
au BufWritePost *.py :exec '!clear;python3' shellescape(@%, 1)
au FileType python map <F5> :exec '!clear;python3' shellescape(@%, 1)<CR>
au BufWritePost *.tex :exec '!lualatex' shellescape(@%, 1)

"plugins
autocmd vimenter * NERDTree
let NERDTreeShowHidden=1

"enable tabs in airline
let g:airline#extensions#tabline#enabled = 1

