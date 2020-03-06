set number	    " Show line numbers
" set linebreak	    " Break lines at word (requires Wrap lines)
" set showbreak=+++   " Wrap-broken line prefix
set colorcolumn=80
set smartcase	    " Enable smart-case search
set hlsearch        " Highlight search
set incsearch	    " Searches for strings incrementally
set noic            " No insensitive case
set encoding=UTF-8
set autoindent	    " Auto-indent new lines
set expandtab	    " Use spaces instead of tabs
set shiftwidth=2    " Number of auto-indent spaces set smartindent
set smarttab	    " Enable smart-tabs set softtabstop=2
set clipboard=unnamed
set encoding=utf-8
set showmatch	    " Highlight matching brace
set swapfile
set dir=~/.swp/     " Define path to swp files on $HOME
set foldmethod=indent " automatically fold by indent level
set nofoldenable      " ... but have folds open by default<Paste>
set nocompatible    " be improved, required
set splitright
set splitbelow
filetype off        " required

" Auto install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  " === THEMES ===
  Plug 'arcticicestudio/nord-vim'

  " === Tools ===
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'Yggdroot/indentLine'
  Plug 'airblade/vim-gitgutter'
  Plug 'ervandew/supertab'
  Plug 'gko/vim-coloresque'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'mattn/emmet-vim'
  Plug 'neomake/neomake'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'prettier/vim-prettier'
  Plug 'ryanoasis/vim-devicons'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/syntastic'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'zivyangll/git-blame.vim'

  " === Laravel PHP ===
  Plug 'StanAngeloff/php.vim', { 'for': 'php' }
  Plug 'jwalton512/vim-blade', { 'for': 'php' }

  " === JavaScript ===
  Plug 'burner/vim-svelte', { 'for': 'svelte' }
  Plug 'jparise/vim-graphql', { 'for': 'js' }
  Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
  Plug 'leafgarland/typescript-vim', { 'for': 'ts' }
  Plug 'maxmellon/vim-jsx-pretty', { 'for': ['js', 'jsx'] }
  Plug 'pangloss/vim-javascript', { 'for': ['js', 'jsx'] }
  Plug 'posva/vim-vue', { 'for': 'vue' }
  Plug 'yardnsm/vim-import-cost', { 'do': 'npm install', 'for': ['js', 'jsx', 'vue', 'ts'] }

  " === Ruby / Ruby on Rails ===
  Plug 'ngmy/vim-rubocop', { 'for': 'rb' }
  Plug 'tpope/vim-rails', { 'for': 'rb' }

  " === Elixir / Phoenix ===
  Plug 'elixir-editors/vim-elixir', { 'for': 'xs' }

  " === Rust ===
  Plug 'rust-lang/rust.vim', { 'for': 'rs' }

  " === Other files ===
  Plug 'cespare/vim-toml', { 'for': 'toml' }
  Plug 'mustache/vim-mustache-handlebars', { 'for': 'handlebars' }
call plug#end()

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

let mapleader = ","
nnoremap <Leader>i :<C-u>call gitblame#echo()<CR>
nnoremap <Leader>g :Gblame<Esc>
noremap <C-p> :FZF<CR>
noremap <C-s> :Rg<CR>
nmap <silent> <leader>mc <ESC>/\v^[<=>]{7}( .*\|$)<CR>
nmap <silent> <leader>bp <ESC>/binding.pry<CR>
nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)
nmap <leader>c :term ++curwin<CR>
nmap <leader>r :source ~/.config/nvim/init.vim<CR>
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
nmap <C-u> :bprevious<Esc>
nmap <C-i> :bnext<Esc>
map <leader> <Plug>(easymotion-prefix)
map <leader>t :NERDTreeToggle<Enter>
map <leader>m /=======\\|<<<<<<< HEAD\\|>>>>>>> .*<CR>

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" === Syntax | Theme ===
syntax enable
syn on
" set cursorline

" === THEMES ===
" colorscheme nord
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_status_lines = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_uniform_diff_background = 1
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:airline_theme='nord'

set statusline+=%{gutentags#statusline()}
call neomake#configure#automake('nrwi', 500)

let g:neosnippet#enable_completed_snippet = 1
let g:deoplete#enable_at_startup = 1

" React config
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']

" GrpahQL
au BufNewFile,BufRead *.prisma setfiletype graphql

" Rails config
set omnifunc=rubycomplete#Complete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_rails = 1

" NERDTree stuff
autocmd StdinReadPre * let s:std_in1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" This add tabs (buffers) on the top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" ESLint
let g:ale_linters = { 'javascript': ['eslint'], 'jsx': ['eslint'] }
let g:ale_fixers = { 'javascript': ['eslint'], 'jsx': ['eslint'], 'js': ['eslint'], 'scss': ['prettier'] }
let g:ale_fix_on_save = 1

" Emmet
let g:user_emmet_install_global = 1
let g:user_emmet_leader_key='<C-Z>'

" PHP Blade Laravel
let g:blade_custom_directives = ['datetime', 'javascript']
autocmd BufRead,BufNewFile   *.php set shiftwidth=4

" Reset colors
hi ColorColumn ctermbg=8
hi LineNr ctermfg=239
hi airline_tabfill ctermbg=NONE guibg=NONE
hi Comment ctermfg=242
hi VertSplit ctermfg=darkgray ctermbg=NONE cterm=NONE
hi Visual ctermbg=238 gui=NONE
hi clear NeomakeError
hi clear NeomakeWarning
hi clear NeomakeInfo
hi NeomakeInfo    cterm=underline gui=underline ctermfg=Black  ctermbg=White
hi NeomakeWarning cterm=underline gui=underline ctermfg=Black ctermbg=Yellow
hi NeomakeError   cterm=underline gui=underline ctermfg=White ctermbg=Red

if has('nvim')
  set fillchars=vert:\│,eob:\ 
endif
