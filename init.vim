
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'zxqfl/tabnine-vim'
Plug 'itchyny/lightline.vim'
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

call plug#end()


"Interface Config
syntax enable
set encoding=utf-8
set number
set relativenumber
set mouse=a

"Theme Config
set background=dark
colorscheme gruvbox

"Shortcuts
nnoremap <C-o> :NERDTreeToggle <cr>
nnoremap <C-s> :w! <cr>
nnoremap <C-q> :q! <cr>

"Flag Bad White space
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"Python files config
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
let python_highlight_all=1
syntax on

"'Web' files config
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2


"virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

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
