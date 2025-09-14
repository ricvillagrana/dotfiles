" Ricardo Villagrana's vimrc
" =========================
" Check: onInstall


set number	    " Show line numbers
" set linebreak	    " Break lines at word (requires Wrap lines)
" set showbreak=+++ " Wrap-broken line prefix
set colorcolumn=120 " 80
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
 set mouse= " a: enable mouse support
filetype off        " required

" Auto install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  " === COLORSCHEMES ===
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'rebelot/kanagawa.nvim'
  Plug 'projekt0n/github-nvim-theme'
  Plug 'morhetz/gruvbox'
  Plug 'neanias/everforest-nvim', { 'branch': 'main' }

  " === GPT ===
  Plug 'github/copilot.vim'

  " === UI ===
  Plug 'romgrk/barbar.nvim' " Bufferline
  Plug 'nvim-tree/nvim-web-devicons' " Bufferline icons
  Plug 'lewis6991/gitsigns.nvim' " Bufferline git
  Plug 'eslint/eslint' " Linting
  Plug 'neomake/neomake' " Linting
  Plug 'ntpeters/vim-better-whitespace' " Whitespace
  Plug 'nvim-lualine/lualine.nvim' " Statusline
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'nvim-tree/nvim-web-devicons' " Icons
  Plug 'folke/snacks.nvim'

  " === Functionality ===
  Plug 'Yggdroot/indentLine' " Indent lines
  "Plug 'ervandew/supertab' " Tab completion | Enable if Copilot is disabled
  Plug 'jiangmiao/auto-pairs' " Auto pairs {}
  Plug 'ludovicchabant/vim-gutentags' " Git tags
  Plug 'mattn/emmet-vim' " Emmet
  Plug 'nvim-lua/plenary.nvim' " Telescope dependency
  Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
  Plug 'junegunn/fzf.vim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' } " Fuzzy finder
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } " Highlighting
  Plug 'ryanoasis/vim-devicons' " REMOVE
  Plug 'scrooloose/nerdcommenter'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'zivyangll/git-blame.vim'
  Plug 'lewis6991/gitsigns.nvim'

  " === Laravel PHP ===
  Plug 'StanAngeloff/php.vim', { 'for': 'php' }
  Plug 'jwalton512/vim-blade', { 'for': 'php' }
  Plug 'joonty/vim-xdebug', { 'for': 'php' }

  " === JavaScript ===
  Plug 'jelera/vim-javascript-syntax', { 'for': ['js', 'jsx', 'vue'] }
  Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
  Plug 'leafgarland/typescript-vim', { 'for': 'ts' }
  Plug 'maxmellon/vim-jsx-pretty', { 'for': ['js', 'jsx', 'mdx', 'vue'] }
  Plug 'pangloss/vim-javascript', { 'for': ['js', 'jsx', 'mdx', 'vue'] }
  Plug 'posva/vim-vue', { 'for': ['js', 'vue', 'jsx'] }
  Plug 'yardnsm/vim-import-cost', { 'do': 'npm install', 'for': ['js', 'jsx', 'vue', 'ts'] }

  " === Ruby / Ruby on Rails ===
  Plug 'ngmy/vim-rubocop', { 'for': 'rb' }
  Plug 'tpope/vim-rails', { 'for': 'rb' }
  Plug 'thoughtbot/vim-rspec', { 'for': 'rb' }

  " === Python ===
  Plug 'nvie/vim-flake8', { 'for': 'python' }
  Plug 'microsoft/pyright', { 'for': 'python' }

  " === Elixir / Phoenix ===
  Plug 'elixir-editors/vim-elixir', { 'for': 'xs' }

  " === Rust ===
  Plug 'rust-lang/rust.vim', { 'for': 'rs' }

  " === Other files ===
  Plug 'cespare/vim-toml', { 'for': 'toml' }
  Plug 'mustache/vim-mustache-handlebars', { 'for': 'handlebars' }
  Plug 'amadeus/vim-mjml', { 'for': 'mjml' }
  Plug 'jparise/vim-graphql'
call plug#end()

" telescope.nvim
lua << EOF
require('lualine').setup()
require("nvim-tree").setup()
require('gitsigns').setup()

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
      },
    },
  },
}
require('nvim-treesitter.configs').setup {
   indent = {
     enable = true,
   },
 }
EOF

let mapleader = ","

nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <Leader>i :<C-u>call gitblame#echo()<CR>
nnoremap <Leader>g :Git blame<Esc>

" Telescope
noremap <C-p> :Telescope find_files<CR>
noremap <C-s> :Telescope live_grep<CR>
noremap <C-B> :Telescope buffers<CR>
noremap <C-t> :tabedit %<CR>
noremap <C-c> :Rg<CR>

nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv

" Look for breakpoints
nmap <silent> <leader>bp <ESC>/binding.*\\|debugger\\|byebug\\|console\..*\\|dd(.*)\\|var_dump(.*)\\|var_dump<CR>
" Format code
nmap <leader>e :lua vim.lsp.buf.format()<CR>
" Reload vimrc
nmap <leader>r :source ~/.config/nvim/init.vim<CR>
" move between panes without using <C-w>
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
nmap <S-k> <C-W>k
" Rotate buffer using current pane
nmap <C-u> :bprevious<Esc>
nmap <C-i> :bnext<Esc>
nmap <C-o> :bnext<Esc>
nmap <C-x> :BufferClose<CR>

map <leader> <Plug>(easymotion-prefix)
map <leader>t :NvimTreeToggle<Enter>
map <leader>s :NvimTreeFindFile<Enter>
map <leader>f :BufferCloseAllButVisible<Enter>
" Look for merge conflicts
map <leader>m /=======\\|<<<<<<< .*\\|>>>>>>> .*<CR>
" Enable/Disable Copilot
map <leader>1 :Copilot enable<Enter> :Copilot status<Enter>
map <leader>0 :Copilot disable<Enter> :Copilot status<Enter>

" Custom commands
command ThemeGruvboxLight        execute ':colorscheme gruvbox | :set background=light'
command ThemeGruvboxDark         execute ':colorscheme gruvbox | :set background=dark'
command ThemePalenight           execute ':colorscheme palenight | :set background=dark'
command ThemePaperColor          execute ':colorscheme PaperColor | :set background=dark'
command ThemePaperColorLight     execute ':colorscheme PaperColor | :set background=light'
command ThemeKanagawa            execute ':colorscheme kanagawa'
command ThemeEverforest          execute ':colorscheme everforest | :set background=dark'

" === Syntax | Theme ===
syntax enable
syn on

" onInstall: change gutentags_ctags_executable to the universal-ctags path
set statusline+=%{gutentags#statusline()}
let g:gutentags_ctags_executable = '/usr/local/bin/ctags'
let g:gutentags_cache_dir = '~/.cache/gutentags'
let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "*.vim/bundle/*"]

if has('nvim') || has('vim')
  call neomake#configure#automake('nrwi', 500)
endif

let g:neosnippet#enable_completed_snippet = 1
let g:deoplete#enable_at_startup = 1

" Automatically rebalance windows when vim is resizes
autocmd VimResized * :wincmd =

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
let g:surround_{char2nr('-')} = "<% \r %>"
let g:surround_{char2nr('=')} = "<%= \r %>"

" This add tabs (buffers) on the top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='jet'
hi airline_tabfill ctermbg=NONE guibg=NONE

" Emmet
autocmd FileType html,css,erb,jsx,js,ejs EmmetInstall
let g:user_emmet_install_global = 1
let g:user_emmet_leader_key='<C-Z>' " CTRL-Z then ,

" colorscheme sets
" set background=light
set termguicolors
set t_Co=256

" colorscheme palenight
" colorscheme oceanic_material
" colorscheme iceberg
" colorscheme gruvbox
" colorscheme papercolor
" colorscheme catppuccin
" colorscheme nightfly
" colorscheme catppuccin-mocha
" colorscheme everforest
 colorscheme kanagawa


" === THE ABYSS ===
" Large stuff that I don't want to see

" Vue
function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
  let ft=toupper(a:filetype)
  let group='textGroup'.ft
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
  execute 'syntax region textSnip'.ft.'
  \ matchgroup='.a:textSnipHl.'
  \ keepend
  \ start="'.a:start.'" end="'.a:end.'"
  \ contains=@'.group
endfunction

autocmd BufNewFile,BufRead *.vue call TextEnableCodeSnip('javascript' ,'<script>' ,'</script>', 'SpecialComment')


" PHP Blade Laravel
let g:blade_custom_directives = ['datetime', 'javascript']
autocmd BufRead,BufNewFile   *.vue set shiftwidth=2
autocmd BufRead,BufNewFile   *.js set shiftwidth=2
autocmd BufRead,BufNewFile   *.rs set shiftwidth=2
autocmd BufRead,BufNewFile   *.php set shiftwidth=4

autocmd BufRead,BufNewFile *.php setlocal omnifunc=phpcomplete#CompletePHP
autocmd BufRead,BufNewFile *.php setlocal autoindent
autocmd BufRead,BufNewFile *.php setlocal shiftwidth=4 softtabstop=4
autocmd BufRead,BufNewFile *.php setlocal tabstop=4
autocmd BufRead,BufNewFile *.php setlocal formatoptions=crqn1
autocmd BufRead,BufNewFile *.php setlocal cinoptions=:0,g0,(0,W4s
autocmd BufRead,BufNewFile *.php setlocal comments=s1:/*,mb:*,ex:*/,://,:#
autocmd BufRead,BufNewFile *.php setlocal foldmethod=indent
autocmd BufRead,BufNewFile *.php setlocal foldnestmax=10
autocmd BufRead,BufNewFile *.php setlocal noexpandtab
autocmd BufRead,BufNewFile *.php setlocal smarttab

if has('nvim')
  set fillchars=vert:\│,eob:\ 
endif
