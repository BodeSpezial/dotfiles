""" Plug
call plug#begin('~/.vim/plugged')
"Plug 'tweekmonster/startuptime.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'on': 'CocStart' }

Plug 'danishprakash/vim-docker'
Plug 'lervag/vimtex'
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'ilyachur/cmake4vim'
call plug#end()
""" Plug end

syntax enable
hi VertSplit    ctermfg=7    ctermbg=8    cterm=NONE
hi Pmenu        ctermfg=15   ctermbg=8 "tabmenu color

" show errors in numbercolumn
set signcolumn=number
" show begun commands
set showcmd
" use more natural splitting
set splitbelow
set splitright

set number relativenumber
augroup numbertoggle
  au!
  au BufEnter,FocusGained,InsertLeave * set relativenumber
  au BufLeave,FocusLost,InsertEnter   * set norelativenumber
  au BufEnter,FocusGained,InsertLeave NERD_tree* set norelativenumber
augroup END

set autoindent "activate autoindent
set encoding=UTF-8 "set encoding to utf-8 for devicons

set expandtab "use_spaces_instead_of_tabs
set tabstop=4 "set tabsize to 4
set softtabstop=4 "delete 4 spaces w/ backspace
set backspace=indent,eol,start "enable backspace
autocmd FileType make setlocal noexpandtab "use tabs for makefile

set vb t_vb= "disable beep and flash

imap jj <Esc>

""" COC
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
""" COC end

""" Moving
" use ctrl+j/k/l/w to move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
""" Moving end

""" Autocmds
"execute save
"au BufWritePost *.py :exec '!clear;python3' shellescape(@%, 1)
"au FileType python map <F5> :exec '!clear;python3' shellescape(@%, 1)<CR>
" au BufWritePost *.tex :exec '!lualatex' shellescape(@%, 1)

"augroup remember_folds
  "au!
  "au BufWinLeave * mkview
  "au BufWinEnter * silent! loadview
"augroup END
""" Aucmds end

""" Airline
"enable tabs in airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_filetype_overrides = { 
 \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
         \}

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_theme='term'

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'
""" Airline end

""" NERDTree
" colors
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

"open NERDTree autmatically
" au vimenter * NERDTree
" go to 2nd available window
" au Vimenter * 2wincmd w

"close NERDTree, when it's the last window left
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"show hidden files in NERDTree
let NERDTreeShowHidden=1

let NERDTreeMinimalUI=1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

let g:NERDTreeSortHiddenFirst = 1
""" NERDTree end

""" Rainbow
let g:rainbow_active = 1
""" Reinbow end 

""" LaTeX
let g:tex_flavor='latex'
"""

""" cmake4vim
let g:cmake_reload_after_save=1
let g:cmake_build_dir_prefix='build-'
""" cmake4vim end
