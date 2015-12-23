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
call vundle#begin()
Plugin 'gmarik/vundle'

" Colours!
" Plugin 'Solarized'
" Use "vim/" if not checkout out the old commit
" Plugin 'daylerees/colour-schemes' { 'rtp': 'vim-themes/' }

Plugin 'daylerees/colour-schemes', { 'rtp': 'vim/' }

" Plugin 'print_bw.zip'
" Tabs?
" Plugin 'techlivezheng/vim-plugin-minibufexpl'
" noremap <C-TAB>   :MBEbn<CR>
" noremap <C-S-TAB> :MBEbp<CR>
" TODO make sure the C-TAB makes it into the terminal
noremap <C-TAB> :bnext<CR>
noremap <C-S-TAB> :bprev<CR>
" " Or, in MRU fashion
" "
" noremap <A-S-TAB>   :MBEbf<CR>
" noremap <A-TAB> :MBEbb<CR>

" Project config in .projections.json for a project
" Notable, :A to switch to alternate file
Plugin 'tpope/vim-projectionist'
" Things like ci" for change inside quotes
" Or cst" for change surrounding <tag> to quotes
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
" gcc to comment a line, gcu to uncomment
" I forked to remove \\ as comment
Plugin 'tbelaire/vim-commentary'

" ]d [d for gitGutter hunks
Plugin 'tpope/vim-unimpaired'

Plugin 'tpope/vim-fugitive'
" Remove buffers once you move away
" autocmd BufReadPost fugitive://* set bufhidden=delete

" For :Make and :Dispatch
Plugin 'tpope/vim-dispatch'

" Tells you about changes
Plugin 'airblade/vim-gitgutter'

Plugin 'gregsexton/gitv'

" aa for argumnet
" ia for argument without ,
" aA and iA eat the separator before not after
Plugin 'b4winckler/vim-angry'
" Unix commands
Plugin 'tpope/vim-eunuch'

" W! to sudo then write
Plugin 'gmarik/sudo-gui.vim'
" Working with ag
Plugin 'rking/ag.vim'

" Extends the keystrokes ga to show more information than just hex
Plugin 'tpope/vim-characterize'
" cr{s,c,m,u} for CoeRce to snake_case, camelCase, MixedCase, UPPER_CASE
Plugin 'tpope/vim-abolish'
" s{char}{char}, jump to cc, ; to repeat, ^O to return to start
" Operator is z
Plugin 'justinmk/vim-sneak'
"ctrlp is buggy or something.  Not showing all my files
Plugin 'kien/ctrlp.vim'
" This should limit it to only files tracked by git....
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
"Plugin 'Command-T'

Plugin 'wesQ3/vim-windowswap'
" Move splits around
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>ww :call WindowSwap#DoWindowSwap()<CR>
" File tray
Plugin 'scrooloose/nerdtree'

" gui undo
Plugin 'sjl/gundo.vim'


Plugin 'tommcdo/vim-exchange'
" cx
" On the first use, define the first {motion} to exchange. On the second use, define the second {motion} and perform the exchange.
" cxx
" Like cx, but use the current line.
" cxc
" Clear any {motion} pending for exchange.

" Bulk file rename
Plugin 'renamer.vim'


" Completely changes the clipboard
" old d is now m,
" d now doesn't copy
" s is a command to delete and then paste,
" ex.  sw deletes a word and pastes a new one
" after a p, you can use c-n and c-p to change it
" to the older or newer yank
" Plugin 'svermeulen/vim-easyclip'

" \\f to activate
" Plugin 'Lokaltog/vim-easymotion'
" Let it use the number keys instead of the alphabet
" let g:EasyMotion_keys = '1234567890'

" Line things up
" gl_ and gL_
" as actions to put spaces to the left of or right of _
Plugin 'tommcdo/vim-lion'
" Need to learn how to use
" Plugin 'godlygeek/tabular'
" Does not work
"Plugin 'vim-scripts/Align'

Plugin 'Syntastic'
" This should have awesome error finding before compiling
" let g:syntastic_python_checker_args = ''
let g:syntastic_python_checkers=['pep8']
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" Let syntastic open the error list if there are errors
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 3
let g:syntastic_cpp_compiler = '/usr/bin/clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11'



" Check out later when using unite.vim
" http://www.codeography.com/2013/06/17/replacing-all-the-things-with-unite-vim.html
"
set laststatus=2                " Always show the statusline
" Newer statusline, since powerline has moved on
Plugin 'bling/vim-airline'
" let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

" Old powerline, also not the python one
" Plugin 'Lokaltog/vim-powerline'
" let g:Powerline_symbols = 'fancy'
" let g:Powerline_theme = 'default'

" autocomplete using clang
" Plugin 'clang-complete'
" let g:clang_user_options='|| exit 0'
" autocoomplete using ctags
" Doesn't seem to work
"Plugin 'code_complete'


" Plugin 'Valloric/YouCompleteMe'

" autocomplete using clang

" Tag browser
" Plugin 'vim-scripts/taglist.vim' " Lets try something more modern
Plugin 'majutsushi/tagbar'
nnoremap <leader>t :TagbarToggle<CR>

" Autobuilds builds ctags files
" Plugin 'vim-misc'
" Plugin 'xolox/vim-easytags'

" Find stdlib help in dash
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
" TODO use the above

" function <SID>StripTrailingWhitespaces()
"     let l = line(".")
"     let c = col(".")
"     %s/\s\+$//e
"     call cursor(l, c)
" endfun

" autocmd FileType c,cpp,java,php,ruby,python,javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
" ============= Language specific stuff ===============
" This stores lots of ftplugins and such, so only `Plugin`
" lines should need to be in here.  Maybe globals too...
Plugin 'tbelaire/vim_filetypes'

" Markdown
" Doesn't seem to work
"Plugin 'swaroopch/vim-markdown-preview'

" For python
" TODO find out what it does
" It highlights eol whitespace while I'm typing
"Plugin 'klen/python-mode'
" Virtualenv stuff
Plugin 'virtualenv.vim'

Plugin 'hynek/vim-python-pep8-indent'

" For racket files
Plugin 'https://github.com/wlangstroth/vim-racket'

" For Clojure code
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-fireplace'

" Jsx
" Plugin 'mxw/vim-jsx'
" Javascript
Plugin 'marijnh/tern_for_vim'

" C++ LLDB
Plugin 'gilligan/vim-lldb'

" Less
Plugin 'groenewege/vim-less'

" TOML, ini like config file used by cargo
Plugin 'cespare/vim-toml'
" Rust
Plugin 'wting/rust.vim'
" idris (like haskell and coq)
Plugin 'idris-hackers/idris-vim'

" Haskell Fun stuff
" Alternate haskell mode stuff
Plugin 'bitc/vim-hdevtools'
" In ftplugin:
" nnoremap <buffer> <LocalLeader>t :HdevtoolsType<CR>
" nnoremap <buffer> <LocalLeader>T :HdevtoolsClear<CR>

" PluginInstall 'file://Users/theobelaire/Code/Vim/vim-cabal-hdevtools'

" Plugin 'tpope/vim-pathogen'
" execute pathogen#infect('bundle/{}', '~/Code/Vim/{}')

" if 1
"     function! s:FindCabalSandbox()
"        let l:sandbox    = finddir('.cabal-sandbox', './;../')
"        let l:absSandbox = fnamemodify(l:sandbox, ':p')
"        return l:absSandbox
"     endfunction

"     function! s:FindCabalSandboxPackageConf()
"        return glob(s:FindCabalSandbox() . '*-packages.conf.d')
"     endfunction

"     function! s:HaskellSourceDir()
"         let l:cabal_file = findfile('*.cabal', '.;')
"         shell("normal! !extract-haskell-source-dir " . l:cabal_file)
"         " exec
"         " exec "normal! !extract-haskell-source-dir " . l:cabal_file
"         return
"     endfunction

"     let g:hdevtools_options  = '-g-package-conf=' . s:FindCabalSandboxPackageConf()
"     let g:hdevtools_options .= ' ' . '-g-i' . s:HaskellSourceDir()

"     Plugin 'bitc/vim-hdevtools'
"     au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
"     au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
"     au FileType haskell command! Type HdevtoolsType
"     " example of how to pass options to ghc
"     " let g:hdevtools_options = '-g-isrc -g-Wall'
"     " TODO make it only write the command once
" else
"     Plugin 'lukerandall/haskellmode-vim'
"     " If you want to highlight delimiter characters (useful if you have a
"     " light-coloured background), add to your .vimrc: >
"     " let hs_highlight_delimiters = 1
"     " To treat True and False as keywords as opposed to ordinary
"     " identifiers,
"     let hs_highlight_boolean = 1
"     let hs_allow_hash_operator = 1

"     au BufEnter *.hs compiler ghc
"     let g:haddock_browser="open -a Google\ Chrome"

"     "Displaying the type of sub-expressions (ghc-mod type)
"     "Displaying error/warning messages and their locations (ghc-mod check and ghc-mod lint)
"     "Displaying the expansion of splices (ghc-mod expand)
"     " Plugin 'eagletmt/ghcmod-vim'

"     " Pre-requisite for the above
"     " Plugin 'Shougo/vimproc.vim'
"     " It also has some makefile that must be run
"     " Annoying
"     " Plugin 'eagletmt/tinytest'
" endif

" For Coq
Plugin 'def-lkb/vimbufsync'
Plugin 'tbelaire/coquille'
" Maps Coquille commands to <F2> (Undo), <F3> (Next), <F4> (ToCursor)
au FileType coq call coquille#FNMapping()

function! LaunchHoq()
    let g:coquille_coqtop_path="hoqtop"
    let b:syntastic_checkers = ["hoqtop"]
    call coquille#Launch()
endfunction

command! -bar -buffer -nargs=* -complete=file HoqLaunch call LaunchHoq()


" LaTeX Stuff.  Compile with \ll
" Plugin 'LaTeX-Box-Team/LaTeX-Box'
"
" For TeX
Plugin 'tex_autoclose.vim'


let g:macvim_skim_app_path='/opt/homebrew-cask/Caskroom/skim/1.4.10/Skim.app'
let g:macvim_skim_out_dir='out'
" let g:macvim_skim_pdftex_command='/usr/texbin/latexmk'
Plugin 'tbelaire/macvim-skim'

" Conceal \delta and such, and don't make them super ugly
" set conceallevel=1
" highlight Conceal guibg=bg
" let g:tex_conceal="gm"




" Pair prograimming
" Plugin 'Floobits/floobits-vim'
" Co-operative vim
" Kinda buggy
" Plugin 'FredKSchott/CoVim'


" ================ End of Plugins ====================
call vundle#end()
filetype plugin indent on
" ================ General Config ====================
if &shell =~# 'fish$'
  set shell=/bin/bash
endif

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

set colorcolumn=80

" Allow color schemes to do bright colors without forcing bold.
" if &t_Co == 8 && $TERM !~# '^linux'
"   set t_Co=16
" endif

" Save work when tabbing away.  I think it requires gui
"au FocusLost * :wa

let mapleader = "\\"
let maplocalleader = ","

" sets jj to to exit insert mode
inoremap jj <ESC>

" dd will not store into the default reguster if it's
" an empty line I delete
nnoremap <expr> dd match(getline('.'), '^\s*$') == -1 ? 'dd' : '"_dd'

" *E*dit my *V*imrc in a split
nnoremap <leader>ev :split $MYVIMRC<cr>
" *S*ource my *V*imrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Move between splits with just C-hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <F1> <NOP>
inoremap <F1> <NOP>
" ================ Copy & Paste =====================
" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
" noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif
" ================ Movement Config  =================
"
" Select and shift arrow keys work as 'normal' or nonvimily
if has("gui_macvim")
    let macvim_hig_shift_movement = 1
endif

nnoremap ]d :GitGutterNextHunk<CR>
nnoremap [d :GitGutterPrevHunk<CR>

" I tend to think I'm not in select mode when I type these commands
snoremap : <C-G>:
snoremap / <C-G>/

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set gdefault         "Default is now to chang all occurences on a line
" --Use normal regexs, not vim ones--
" Actually search for + and so on, instead of having to escape it
"nnoremap / /\v
"vnoremap / /\v
" Set <leader><space> to clear the search and highlighting
nnoremap <leader><space> :noh<cr>
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" ================ Typos of Commands ================
command! Wq wq
command! WQ wq
command! W w
command! Q q
" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works in MacVim (gui) mode. As of 7.3 it doesn't require gui
" or maybe it doesn't work...
"set undodir=~/.vim/backups
"set undofile

" ================ Indentation ======================
set autoindent
" set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set shiftround

filetype plugin on
filetype indent on

" Show whitespace
set list
" Display tabs and trailing spaces visually
set listchars=tab:>\ ,trail:␣,extends:>,precedes:<,nbsp:+
" Possible space ␣ \u2423
" Other space · \u00b7

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
" ================= LaTeX ============================
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
    imap \cross ×
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

    imap \iv ⁻¹

    imap \doublearrow ⇋

    imap \QED ∎
endfunction

" autocmd BufRead,BufNewFile *.txt :call DoMath()
" autocmd BufRead,BufNewFile *.mdown :call DoMath()
" ================= Python ===========================
"
" Add the virtualenv's site-packages to vim path
if has('python')
    function DoVirtualenv()
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
    endfunction
    call DoVirtualenv()
endif

