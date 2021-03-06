
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'zxqfl/tabnine-vim'
Plug 'junegunn/fzf'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'valloric/youcompleteme'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'thaerkh/vim-indentguides'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'Shougo/deoplete.nvim'
Plug 'bling/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'cj/vim-webdevicons'
Plug 'vim-scripts/bash-support.vim'
Plug 'gorodinskiy/vim-coloresque'
Plug 'frazrepo/vim-rainbow'
Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/AutoComplPop'

call plug#end()

"Paths you complete me
let g:ycm_python_binary_path = 'python'

"Interface Config
syntax enable
set encoding=utf-8
set number
set relativenumber
set mouse=a

"Theme Config
set background=dark
colorscheme gruvbox

"complpop
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c

"Python files config
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set textwidth=79
    \| set expandtab
    \| set autoindent
    \| set fileformat=unix
let python_highlight_all=1
syntax on

"'Web' files config
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"Git Marks
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'~',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" Ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'python': [
\       'isort',
\       'yapf',
\       'remove_trailing_lines',
\       'trim_whitespace'
\   ]
\}

"Swaping lines
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

"Shortcuts
noremap <silent> <c-s-down> :call <SID>swap_down()<CR>
noremap <silent> <c-s-up> :call <SID>swap_up()<CR>
nnoremap <C-o> :NERDTreeToggle <cr>
nnoremap <C-r> :NERDTreeRefreshRoot <cr>
nnoremap <C-s> :w! <cr>
nnoremap <C-q> :q! <cr>
