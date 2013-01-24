" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" =============== Vundle Initialization ===============
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" =============== Vundle Packagages ==================
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-eunuch'

"ctrlp is buggy or something.  Not shoing all my files
"Bundle 'kien/ctrlp.vim'
Bundle 'Command-T'


Bundle 'Lokaltog/vim-easymotion'
" Let it use the number keys instead of the alphabet
let g:EasyMotion_keys = '1234567890'


" Testing these out
" This should have awesome error finding before compiling
Bundle 'scrooloose/syntastic'
let g:syntastic_python_checker_args = ''

Bundle 'Lokaltog/vim-powerline'
set laststatus=2                " Always show the statusline
let g:Powerline_symbols = 'fancy'
let g:Powerline_theme = 'default'

" Virtualenv stuff
Bundle 'virtualenv.vim'

" Git stuff
Bundle 'vim-scripts/fugitive.vim'

" autocomplete using clang
Bundle 'clang-complete'

" Markdown
" Doesn't seem to work
"Bundle 'swaroopch/vim-markdown-preview'
filetype plugin indent on
" ================ General Config ====================

set encoding=utf-8              "Use utf-8
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
"set gcr=a:blinkon0              "Disable cursor blink

set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window. 
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" turn on syntax highlighting
syntax on

" Turn on the status bar
set ruler

" Save work when tabbing away.  I think it requires gui
"au FocusLost * :wa
" sets jj to to exit insert mode
inoremap jj <ESC>

" *E*dit my *V*imrc in a split
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" *S*ource my *V*imrc
:nnoremap <leader>sv :source $MYVIMRC<cr>

" Move between splits with just C-hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ================ Movement Config  =================
" Set tab to just to matching paren (not bound before?)
"nnoremap <tab> %
"vnoremap <tab> %

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set gdefault         "Default is now to chang all occurences on a line
" Use normal regexs, not vim ones
nnoremap / /\v
vnoremap / /\v
" Set <leader><space> to clear the search and highlighting
nnoremap <leader><space> :noh<cr>
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works in MacVim (gui) mode. As of 7.3 it doesn't require gui
" or maybe it doesn't work...
"set undodir=~/.vim/backups
"set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set wrap       "Yes wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

" ================ Scrolling ========================

set scrolloff=15          "Start scrolling when we're 8 lines away from margins
"Yes wrap lines, so this is not needed
"set sidescrolloff=1
"set sidescroll=1


" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" ================= Math =============================
augroup do_math
    autocmd!
    autocmd BufRead,BufNewFile *.txt :ab alpha α
    autocmd BufRead,BufNewFile *.txt :ab beta β
    autocmd BufRead,BufNewFile *.txt :ab gamma γ
    autocmd BufRead,BufNewFile *.txt :ab delta δ
    autocmd BufRead,BufNewFile *.txt :ab epsilon ε
    autocmd BufRead,BufNewFile *.txt :ab zeta ζ
    autocmd BufRead,BufNewFile *.txt :ab eta η
    autocmd BufRead,BufNewFile *.txt :ab theta θ
    autocmd BufRead,BufNewFile *.txt :ab iota ι
    autocmd BufRead,BufNewFile *.txt :ab kappa κ
    autocmd BufRead,BufNewFile *.txt :ab lambda λ
    autocmd BufRead,BufNewFile *.txt :ab mu μ
    autocmd BufRead,BufNewFile *.txt :ab nu ν
    autocmd BufRead,BufNewFile *.txt :ab xi ξ
    autocmd BufRead,BufNewFile *.txt :ab omicron ο
    autocmd BufRead,BufNewFile *.txt :ab pi π
    autocmd BufRead,BufNewFile *.txt :ab rho ρ
    autocmd BufRead,BufNewFile *.txt :ab sigma σ
    autocmd BufRead,BufNewFile *.txt :ab tau τ
    autocmd BufRead,BufNewFile *.txt :ab upsilon υ
    autocmd BufRead,BufNewFile *.txt :ab phi φ
    autocmd BufRead,BufNewFile *.txt :ab chi χ
    autocmd BufRead,BufNewFile *.txt :ab psi ψ
    autocmd BufRead,BufNewFile *.txt :ab omega ω
    
    autocmd BufRead,BufNewFile *.txt :ab Gamma Γ
    autocmd BufRead,BufNewFile *.txt :ab Delta Δ
    autocmd BufRead,BufNewFile *.txt :ab Theta Θ
    autocmd BufRead,BufNewFile *.txt :ab Lambda Λ
    autocmd BufRead,BufNewFile *.txt :ab Xi Ξ
    autocmd BufRead,BufNewFile *.txt :ab Pi Π
    autocmd BufRead,BufNewFile *.txt :ab Sigma Σ
    autocmd BufRead,BufNewFile *.txt :ab Upsilon Υ
    autocmd BufRead,BufNewFile *.txt :ab Phi Φ
    autocmd BufRead,BufNewFile *.txt :ab Psi Ψ
    autocmd BufRead,BufNewFile *.txt :ab Omega Ω
    
    autocmd BufRead,BufNewFile *.txt :imap \in ∈
    autocmd BufRead,BufNewFile *.txt :imap \notin ∉
    autocmd BufRead,BufNewFile *.txt :imap \subset ⊆
    autocmd BufRead,BufNewFile *.txt :imap \ssubset ⊂
    autocmd BufRead,BufNewFile *.txt :imap \cup ∪
    autocmd BufRead,BufNewFile *.txt :imap \cap ∩
    autocmd BufRead,BufNewFile *.txt :imap \forall ∀
    autocmd BufRead,BufNewFile *.txt :imap \exists ∃
    autocmd BufRead,BufNewFile *.txt :imap \notexists ∄
    autocmd BufRead,BufNewFile *.txt :imap \o+ ⊕
    autocmd BufRead,BufNewFile *.txt :imap \ox ⊗
    autocmd BufRead,BufNewFile *.txt :imap \o- ⊖
    autocmd BufRead,BufNewFile *.txt :imap \o. ⊙
    autocmd BufRead,BufNewFile *.txt :imap \o/ ⊘
    autocmd BufRead,BufNewFile *.txt :imap \cdot ⋅

    autocmd BufRead,BufNewFile *.txt :imap \trans ᵀ
    autocmd BufRead,BufNewFile *.txt :imap \bar  ̅
    autocmd BufRead,BufNewFile *.txt :imap \hat  ̂
    autocmd BufRead,BufNewFile *.txt :imap \wav  ̃
    autocmd BufRead,BufNewFile *.txt :imap \under  ̲
    autocmd BufRead,BufNewFile *.txt :imap \vec  ⃑
    
    autocmd BufRead,BufNewFile *.txt :imap \RR ℝ
    autocmd BufRead,BufNewFile *.txt :imap \CC ℂ
    autocmd BufRead,BufNewFile *.txt :imap \NN ℕ
    autocmd BufRead,BufNewFile *.txt :imap \ZZ ℤ
    autocmd BufRead,BufNewFile *.txt :imap \HH ℍ
    autocmd BufRead,BufNewFile *.txt :imap \QQ ℚ

    autocmd BufRead,BufNewFile *.txt :imap \scriptS 𝒮
    autocmd BufRead,BufNewFile *.txt :imap \scriptT 𝒯
    autocmd BufRead,BufNewFile *.txt :imap \scriptP 𝒫

    autocmd BufRead,BufNewFile *.txt :imap \empty ∅

    autocmd BufRead,BufNewFile *.txt :imap \|-> ↦

    autocmd BufRead,BufNewFile *.txt :imap \subi ᵢ
    autocmd BufRead,BufNewFile *.txt :imap \sub0 ₀
    autocmd BufRead,BufNewFile *.txt :imap \sub1 ₁
    autocmd BufRead,BufNewFile *.txt :imap \sub2 ₂
    autocmd BufRead,BufNewFile *.txt :imap \sub3 ₃
    autocmd BufRead,BufNewFile *.txt :imap \sub4 ₄
    autocmd BufRead,BufNewFile *.txt :imap \sub5 ₅
    autocmd BufRead,BufNewFile *.txt :imap \sub6 ₆
    autocmd BufRead,BufNewFile *.txt :imap \sub7 ₇
    autocmd BufRead,BufNewFile *.txt :imap \sub8 ₈
    autocmd BufRead,BufNewFile *.txt :imap \sub9 ₉

    autocmd BufRead,BufNewFile *.txt :imap \sup0 ⁰
    autocmd BufRead,BufNewFile *.txt :imap \sup1 ¹
    autocmd BufRead,BufNewFile *.txt :imap \sup2 ²
    autocmd BufRead,BufNewFile *.txt :imap \sup3 ³
    autocmd BufRead,BufNewFile *.txt :imap \sup4 ⁴
    autocmd BufRead,BufNewFile *.txt :imap \sup5 ⁵
    autocmd BufRead,BufNewFile *.txt :imap \sup6 ⁶
    autocmd BufRead,BufNewFile *.txt :imap \sup7 ⁷
    autocmd BufRead,BufNewFile *.txt :imap \sup8 ⁸
    autocmd BufRead,BufNewFile *.txt :imap \sup9 ⁹

    autocmd BufRead,BufNewFile *.txt :imap \doublearrow ⇋

    autocmd BufRead,BufNewFile *.txt :imap \QED ∎
augroup END

" ================= Python ===========================
"
" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
