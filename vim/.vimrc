""" Plug
call plug#begin('~/.vim/plugged')
" Install the following for debugging purposes
" Plug 'tweekmonster/startuptime.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier'

" Syntax plugins etc.
Plug 'lervag/vimtex'
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'neovimhaskell/haskell-vim'
Plug 'rust-lang/rust.vim'

"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'preservim/nerdcommenter'

" Status line. ~~~Off by default (less distracting)~~~
Plug 'vim-airline/vim-airline' ", {'on': 'AirlineToggle'}
Plug 'vim-airline/vim-airline-themes' ", {'on': 'AirlineToggle'}

Plug 'nightsense/cosmic_latte'
Plug 'glepnir/dashboard-nvim'

Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'ilyachur/cmake4vim'
Plug 'tpope/vim-fugitive'

" File Tree
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

" Tags
Plug 'preservim/tagbar'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
call plug#end()
""" Plug end

syntax enable

set background=dark
colorscheme cosmic_latte
set termguicolors
set cursorline
set laststatus=0
hi VertSplit    ctermfg=7    ctermbg=8    cterm=NONE guifg=7 guibg=8 gui=NONE
hi CursorLineNr guifg=#7d9761 gui=bold

" show errors in numbercolumn
" set signcolumn=number
" show begun commands
set showcmd
" use more natural splitting
set splitbelow
set splitright

set number relativenumber

set autoindent "activate autoindent
set encoding=UTF-8 "set encoding to utf-8 for devicons

set expandtab "use_spaces_instead_of_tabs
set tabstop=4 "set tabsize to 4
set softtabstop=4 "delete 4 spaces w/ backspace
set shiftwidth=4
set backspace=indent,eol,start "enable backspace
autocmd FileType make setlocal noexpandtab "use tabs for makefile

set vb t_vb= "disable beep and flash

imap jj <Esc>

let mapleader = ","

""" Leader Shortcuts
map <leader>h :noh<CR>
map <leader>ff :FZF<CR>
map <leader>cc <plug>NERDCommenterToggle
""" Leader Shortcuts end

""" easytags
let g:easytags_file = 'tags'
let g:easytags_async = 1
""" easytags end

""" tagbar
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/usr/local/bin/ctags',
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }
""" tagbar end


""" NERDcomment
" Create default mappings
let g:NERDCreateDefaultMappings = 0

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
""" NERDComment end

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

""" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
""" Prettier end

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

""" CHADTree
nnoremap <leader>nt :CHADopen<CR>
let g:chadtree_settings = {
            \"options.show_hidden": v:true,
            \"theme.text_colour_set": "solarized_dark"
\}
""" CHADTree end

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

""" Dashboard
fun OpenDots()
        call fzf#vim#files('~/dotfiles', fzf#vim#with_preview(), 0)
endfun

fun OpenNotes()
        call fzf#vim#files('~/Documents/notes_obsidian', fzf#vim#with_preview(), 0)
endf

fun NewNote()
        call inputsave()
        let nameOfNote = input('Filename: ')
        call inputrestore()
        let filePath = $HOME . '/Documents/notes_obsidian/' . nameOfNote
        execute 'edit' . filePath
endf

let g:dashboard_default_executive ='fzf'
let g:dashboard_custom_header = [
      \'     ⠀⠀⠀⠀⠀⠀⠀⡴⠞⠉⢉⣭⣿⣿⠿⣳⣤⠴⠖⠛⣛⣿⣿⡷⠖⣶⣤⡀⠀⠀⠀  ',
      \'   ⠀⠀⠀⠀⠀⠀⠀⣼⠁⢀⣶⢻⡟⠿⠋⣴⠿⢻⣧⡴⠟⠋⠿⠛⠠⠾⢛⣵⣿⠀⠀⠀⠀  ',
      \'   ⣼⣿⡿⢶⣄⠀⢀⡇⢀⡿⠁⠈⠀⠀⣀⣉⣀⠘⣿⠀⠀⣀⣀⠀⠀⠀⠛⡹⠋⠀⠀⠀⠀  ',
      \'   ⣭⣤⡈⢑⣼⣻⣿⣧⡌⠁⠀⢀⣴⠟⠋⠉⠉⠛⣿⣴⠟⠋⠙⠻⣦⡰⣞⠁⢀⣤⣦⣤⠀  ',
      \'   ⠀⠀⣰⢫⣾⠋⣽⠟⠑⠛⢠⡟⠁⠀⠀⠀⠀⠀⠈⢻⡄⠀⠀⠀⠘⣷⡈⠻⣍⠤⢤⣌⣀  ',
      \'   ⢀⡞⣡⡌⠁⠀⠀⠀⠀⢀⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀⠀⠸⣇⠀⢾⣷⢤⣬⣉  ',
      \'   ⡞⣼⣿⣤⣄⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⣿⠀⠸⣿⣇⠈⠻  ',
      \'   ⢰⣿⡿⢹⠃⠀⣠⠤⠶⣼⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⣿⠀⠀⣿⠛⡄⠀  ',
      \'   ⠈⠉⠁⠀⠀⠀⡟⡀⠀⠈⡗⠲⠶⠦⢤⣤⣤⣄⣀⣀⣸⣧⣤⣤⠤⠤⣿⣀⡀⠉⣼⡇⠀  ',
      \'   ⣿⣴⣴⡆⠀⠀⠻⣄⠀⠀⠡⠀⠀⠀⠈⠛⠋⠀⠀⠀⡈⠀⠻⠟⠀⢀⠋⠉⠙⢷⡿⡇⠀  ',
      \'   ⣻⡿⠏⠁⠀⠀⢠⡟⠀⠀⠀⠣⡀⠀⠀⠀⠀⠀⢀⣄⠀⠀⠀⠀⢀⠈⠀⢀⣀⡾⣴⠃⠀  ',
      \'   ⢿⠛⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⠈⠢⠄⣀⠠⠼⣁⠀⡱⠤⠤⠐⠁⠀⠀⣸⠋⢻⡟⠀⠀  ',
      \'   ⠈⢧⣀⣤⣶⡄⠘⣆⠀⠀⠀⠀⠀⠀⠀⢀⣤⠖⠛⠻⣄⠀⠀⠀⢀⣠⡾⠋⢀⡞⠀⠀⠀  ',
      \'   ⠀⠀⠻⣿⣿⡇⠀⠈⠓⢦⣤⣤⣤⡤⠞⠉⠀⠀⠀⠀⠈⠛⠒⠚⢩⡅⣠⡴⠋⠀⠀⠀⠀  ',
      \'   ⠀⠀⠀⠈⠻⢧⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣻⠿⠋⠀⠀⠀⠀⠀⠀  ',
      \'   ⠀⠀⠀⠀⠀⠀⠉⠓⠶⣤⣄⣀⡀⠀⠀⠀⠀⠀⢀⣀⣠⡴⠖⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀  ',
      \ ]

let g:dashboard_custom_section={
  \ 'a_new_file': {
      \ 'description': [' New file                 , n f'],
      \ 'command':function('dashboard#handler#new_file') },
  \ 'b_open_dotfiles': {
      \ 'description': [' Open dotfiles            , d o'],
      \ 'command':function('OpenDots') },
  \ 'c_notes': {
      \ 'description': [' Search for note          , s n'],
      \ 'command':function('OpenNotes') },
  \ 'd_new_note': {
      \ 'description': [' Create a new note        , n n'],
      \ 'command':function('NewNote') },
  \ 'e_find_file': {
      \ 'description': [' Search for a file        , f f'],
      \ 'command': function('dashboard#handler#find_file') },
  \ 'f_recently_opened_files': {
      \ 'description': [' Recently opened files          '],
      \ 'command':function('dashboard#handler#find_history') },
  \ 'g_find_word': {
      \ 'description': [' Find word                , a g'],
      \ 'command': function('dashboard#handler#find_word') },
  \ 'h_jump_to_bookmarks': {
      \ 'description': [' Jump to bookmarks              '],
      \ 'command':function('dashboard#handler#book_marks') },
  \ }

nnoremap <silent> <Leader>nf :DashboardNewFile <CR>
nnoremap <silent> <Leader>do  :call OpenDots() <CR>
nnoremap <silent> <Leader>sn :call OpenNotes() <CR>
nnoremap <silent> <Leader>nn :call NewNote() <CR>
nnoremap <silent> <Leader>ag :DashboardFindWord <CR>
""" Dashboard end

""" Custom functions/scripts
fun OpenLazygit()
    set nonumber
    terminal lazygit
endf

nnoremap <Leader>l :call OpenLazygit() <CR>
""" Custom functions/scripts end
