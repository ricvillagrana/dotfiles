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
set nocompatible    " be iMproved, required
filetype off        " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'git://git.wincent.com/command-t.git'
  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  " === TOUCHABLE ===

  " === THEMES ===
  Plugin 'bellma101/vim-snazzy'
  Plugin 'drewtempelmeyer/palenight.vim'
  Plugin 'fatih/molokai'
  Plugin 'flrnprz/candid.vim'
  Plugin 'flrnprz/taffy.vim'
  Plugin 'joshdick/onedark.vim'

  " === PLUGINS ===
  Plugin 'StanAngeloff/php.vim'
  Plugin 'Xuyuanp/nerdtree-git-plugin'
  Plugin 'Yggdroot/indentLine'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'burner/vim-svelte'
  Plugin 'cespare/vim-toml'
  Plugin 'elixir-editors/vim-elixir'
  Plugin 'ervandew/supertab'
  Plugin 'gko/vim-coloresque'
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'junegunn/fzf'
  Plugin 'jwalton512/vim-blade'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'mattn/emmet-vim'
  Plugin 'maxmellon/vim-jsx-pretty'
  Plugin 'mustache/vim-mustache-handlebars'
  Plugin 'ngmy/vim-rubocop'
  Plugin 'ntpeters/vim-better-whitespace'
  Plugin 'pangloss/vim-javascript'
  Plugin 'posva/vim-vue'
  Plugin 'prettier/vim-prettier'
  Plugin 'ryanoasis/vim-devicons'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/syntastic'
  Plugin 'tpope/vim-endwise'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-rails'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-sensible'
  Plugin 'tpope/vim-surround'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'zivyangll/git-blame.vim'

call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = ","
map <leader> <Plug>(easymotion-prefix)
map <leader>t :NERDTreeToggle<Enter>
nnoremap <Leader>i :<C-u>call gitblame#echo()<CR>
nnoremap <Leader>g :Gblame<Esc>
nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)
nmap <leader>c :term ++curwin<CR>
nmap <leader>r :source ~/.config/nvim/init.vim<CR>
nmap <C-p> :FZF<CR>
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
nmap <C-u> :bprevious<Esc>
nmap <C-i> :bnext<Esc>

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
"colorscheme onedark
colorscheme taffy

" React config
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']

" Rails config
set omnifunc=rubycomplete#Complete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_rails = 1

" NERDTree stuff
autocmd StdinReadPre * let s:std_in1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap c :bp\|bd #<CR>

" Battery.vim
set statusline=...%{battery#component()}...
let g:battery#update_statusline = 1 " For statusline.

" ESLint
let g:ale_linters = { 'javascript': ['eslint'], 'jsx': ['eslint'] }
let g:ale_fixers = { 'javascript': ['eslint'], 'jsx': ['eslint'], 'js': ['eslint'], 'scss': ['prettier'] }
let g:ale_fix_on_save = 1

" Emmet
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_install_global = 0
autocmd FileType html,css,vue,jsx,erb,php EmmetInstall
let g:user_emmet_leader_key='<C-Z>'

" PHP Blade Laravel
let g:blade_custom_directives = ['datetime', 'javascript']

set fillchars=vert:\│,eob:\ 
