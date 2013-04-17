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

" Things like ci" for change inside quotes
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
" Unix commands
Bundle 'tpope/vim-eunuch'

" Extends the keystrokes ga to show more information than just hex
Bundle 'https://github.com/tpope/vim-characterize'
" Use s like f, but with 2 characters.
Bundle 'https://github.com/goldfeld/vim-seek'
"ctrlp is buggy or something.  Not showing all my files
"Bundle 'kien/ctrlp.vim'
Bundle 'Command-T'

" \\f to activate
Bundle 'Lokaltog/vim-easymotion'
" Let it use the number keys instead of the alphabet
let g:EasyMotion_keys = '1234567890'

" Line things up
Bundle 'godlygeek/tabular'
" Does not work
"Bundle 'vim-scripts/Align'

" Testing these out
" This should have awesome error finding before compiling
Bundle 'scrooloose/syntastic'
let g:syntastic_python_checker_args = ''
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

Bundle 'Lokaltog/vim-powerline'
set laststatus=2                " Always show the statusline
let g:Powerline_symbols = 'fancy'
let g:Powerline_theme = 'default'

" Virtualenv stuff
Bundle 'virtualenv.vim'

" Git stuff
Bundle 'vim-scripts/fugitive.vim'
" Tells you about changes
Bundle 'airblade/vim-gitgutter'

" autocomplete using clang
Bundle 'clang-complete'

" LaTeX Stuff.  Compile with \ll
" Bundle 'LaTeX-Box-Team/LaTeX-Box'
" Markdown
" Doesn't seem to work
"Bundle 'swaroopch/vim-markdown-preview'

" For racket files
Bundle 'https://github.com/wlangstroth/vim-racket'
Bundle 'https://github.com/wlangstroth/vim-haskell'
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
"
" Select and shift arrow keys work as 'normal' or nonvimily
if has("gui_macvim")
    let macvim_hig_shift_movement = 1
endif

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

set scrolloff=8          "Start scrolling when we're 8 lines away from margins
"Yes wrap lines, so this is not needed
"set sidescrolloff=1
"set sidescroll=1


" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk
" ================= LaTex ============================
"g:LatexBox_viewer="/Applications/Skim.app/Contents/SharedSupport/displayline -g 0"
" ================= Math =============================
function! DoMath()
    ab alpha α
    ab beta β
    ab gamma γ
    ab delta δ
    ab epsilon ε
    ab zeta ζ
    ab eta η
    ab theta θ
    ab iota ι
    ab kappa κ
    ab lambda λ
    ab mu μ
    ab nu ν
    ab xi ξ
    ab omicron ο
    ab pi π
    ab rho ρ
    ab sigma σ
    ab tau τ
    ab upsilon υ
    ab phi φ
    ab chi χ
    ab psi ψ
    ab omega ω

    ab Gamma Γ
    ab Delta Δ
    ab Theta Θ
    ab Lambda Λ
    ab Xi Ξ
    ab Pi Π
    ab Sigma Σ
    ab Upsilon Υ
    ab Phi Φ
    ab Psi Ψ
    ab Omega Ω

    imap \in ∈
    imap \notin ∉
    imap \subset ⊆
    imap \ssubset ⊂
    imap \cup ∪
    imap \cap ∩
    imap \forall ∀
    imap \exists ∃
    imap \notexists ∄
    imap \o+ ⊕
    imap \ox ⊗
    imap \o- ⊖
    imap \o. ⊙
    imap \o/ ⊘
    imap \cdot ⋅


    imap \trans ᵀ
    imap \bar  ̅
    imap \hat  ̂
    imap \wav  ̃
    imap \under  ̲
    imap \vec  ⃑


    imap \RR ℝ
    imap \CC ℂ
    imap \NN ℕ
    imap \ZZ ℤ
    imap \HH ℍ
    imap \QQ ℚ

    imap \scriptS 𝒮
    imap \scriptT 𝒯
    imap \scriptP 𝒫

    imap \empty ∅

    imap \|-> ↦

    imap \subi ᵢ
    imap \sub0 ₀
    imap \sub1 ₁
    imap \sub2 ₂
    imap \sub3 ₃
    imap \sub4 ₄
    imap \sub5 ₅
    imap \sub6 ₆
    imap \sub7 ₇
    imap \sub8 ₈
    imap \sub9 ₉

    imap \sup0 ⁰
    imap \sup1 ¹
    imap \sup2 ²
    imap \sup3 ³
    imap \sup4 ⁴
    imap \sup5 ⁵
    imap \sup6 ⁶
    imap \sup7 ⁷
    imap \sup8 ⁸
    imap \sup9 ⁹

    imap \doublearrow ⇋

    imap \QED ∎
endfunction

autocmd BufRead,BufNewFile *.txt :call DoMath()
autocmd BufRead,BufNewFile *.mdown :call DoMath()
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
