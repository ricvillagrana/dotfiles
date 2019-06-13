" General
set number	    " Show line numbers
set linebreak	    " Break lines at word (requires Wrap lines)
set showbreak=+++   " Wrap-broken line prefix
set smartcase	    " Enable smart-case search
set hlsearch        " Highlight search
set incsearch	    " Searches for strings incrementally
set noic            " No insensitive case
set encoding=UTF-8

set autoindent	    " Auto-indent new lines
set expandtab	    " Use spaces instead of tabs
set shiftwidth=2    " Number of auto-indent spaces
set smartindent	    " Enable smart-indent
set smarttab	    " Enable smart-tabs
set softtabstop=2   " Number of spaces per Tab
set mouse=a
set clipboard=unnamed
set encoding=utf-8
set showmatch	    " Highlight matching brace
set swapfile
set dir=~/.swp/     " Define path to swp files on $HOME

" Advanced
set ruler	                " Show row and column ruler information
set undolevels=500	        " Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

" Configure Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" === BEGIN PLUGINS ===

" === THEMES ===
Plugin 'bellma101/vim-snazzy'
Plugin 'fatih/molokai'
Plugin 'joshdick/onedark.vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'flrnprz/candid.vim'

" === PLUGINS ===
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" tpope
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'

Plugin 'gko/vim-coloresque'
Plugin 'ntpeters/vim-better-whitespace'

" Utilities
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'

" Fuzzy finder
"Plugin 'kien/ctrlp.vim'
Plugin 'junegunn/fzf'

" Git
Plugin 'zivyangll/git-blame.vim'
Plugin 'airblade/vim-gitgutter'

" Emmet
Plugin 'mattn/emmet-vim'

" Elixir
Plugin 'elixir-editors/vim-elixir'

" PHP
Plugin 'StanAngeloff/php.vim'
Plugin 'jwalton512/vim-blade'

" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'prettier/vim-prettier'

" React.js
Plugin 'maxmellon/vim-jsx-pretty'

" Vue.js
Plugin 'posva/vim-vue'

" Svelte.js
Plugin 'burner/vim-svelte'

" Ruby and Rails
Plugin 'ngmy/vim-rubocop'

" Coffee Script
Plugin 'kchmck/vim-coffee-script'

" Mustache toml and {Handlebars}
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'cespare/vim-toml'

" Vim Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" YCM
Plugin 'Valloric/YouCompleteMe'

" Icons
Plugin 'ryanoasis/vim-devicons'

" === END PLUGINS ===
call vundle#end()            " required
filetype plugin indent on    " required

" === CONFIGURATION ===

let mapleader = ","
nmap <leader>n :bnext<Esc>
nmap <leader>b :bprevious<Esc>
map <leader> <Plug>(easymotion-prefix)
map <leader>t :NERDTreeToggle<Enter>
nnoremap <Leader>i :<C-u>call gitblame#echo()<CR>
nnoremap <Leader>g :Gblame<Esc>
nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)
nmap <leader>c :term ++curwin<CR>
nmap <C-p> :FZF<CR>

" === Syntax | Theme ===
syntax enable
syn on
set t_Co=256

set background=dark

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" === THEMES ===
"colorscheme snazzy
"colorscheme palenight
"colorscheme molokai
"colorscheme candid
colorscheme onedark

" React config
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']

" Vue config
"autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
let g:vim_vue_plugin_load_full_syntax = 1
let g:vim_vue_plugin_debug = 1
let g:vue_disable_pre_processors = 1
autocmd FileType vue syntax sync fromstart

" Rails config
set omnifunc=rubycomplete#Complete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_rails = 1

" Airline config
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_s
endif

" NERDTree stuff
autocmd StdinReadPre * let s:std_in1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap c :bp\|bd #<CR>

" Battery.vim
set statusline=...%{battery#component()}...
let g:battery#update_statusline = 1 " For statusline.

" YCM
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 1
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 1

let g:NERDTreeIndicatorMapCustom = {
\ "Modified"  : "✹",
\ "Staged"    : "✚",
\ "Untracked" : "✭",
\ "Renamed"   : "➜",
\ "Unmerged"  : "═",
\ "Deleted"   : "✖",
\ "Dirty"     : "✗",
\ "Clean"     : "✔︎",
\ 'Ignored'   : '☒',
\ "Unknown"   : "?"
\ }

"Auto pair
let g:AutoPairs = {
\ '`': '`',
\ '''': '''',
\ '{': '}',
\ '{\n': '\t\n}',
\ '{ ': ' }',
\ '{{ ': ' }}',
\ '(': ')',
\ '( ': ' )',
\ '[': ']',
\ '[\n': '\t\n]',
\ '[ ': ' ]',
\ 'def\s\w\n': '\t\nend',
\ }

" CTRL P
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svu|swp)|node_modules$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" ESLint => Lintern
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'jsx': ['eslint'],
\}

" ESLint => Fixer
let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'jsx': ['eslint'],
\ 'js': ['eslint'],
\ 'scss': ['prettier']
\}
let g:ale_fix_on_save = 1

" Emmet
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_install_global = 0
autocmd FileType html,css,vue,jsx,erb,php EmmetInstall
let g:user_emmet_leader_key='<C-Z>'

" PHP Blade Laravel
let g:blade_custom_directives = ['datetime', 'javascript']

