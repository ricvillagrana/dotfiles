" General
set number	    " Show line numbers
set linebreak	    " Break lines at word (requires Wrap lines)
set showbreak=+++   " Wrap-broken line prefix
set textwidth=100   " Line wrap (number of cols)
set smartcase	    " Enable smart-case search
set ignorecase	    " Always case-insensitive
set incsearch	    " Searches for strings incrementally

set autoindent	    " Auto-indent new lines
set expandtab	    " Use spaces instead of tabs
set shiftwidth=2    " Number of auto-indent spaces
set smartindent	    " Enable smart-indent
set smarttab	    " Enable smart-tabs
set softtabstop=2   " Number of spaces per Tab
set mouse=a
set clipboard=unnamedplus
set encoding=utf-8
set showmatch	    " Highlight matching brace

" Advanced
set ruler	                " Show row and column ruler information

set undolevels=1000	        " Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

" Configure Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" === BEGIN PLUGINS ===
" Put your non-Plugin stuff after this line

" THEMES
Plugin 'kiddos/malokai.vim'
Plugin 'dracula/vim'
Plugin 'KKPMW/sacredforest-vim'
Plugin 'bellma101/vim-snazzy'
Plugin 'ErichDonGubler/vim-sublime-monokai'
Plugin 'koirand/tokyo-metro.vim'
Plugin 'HenryNewcomer/vim-theme-papaya'
Plugin 'Alvarocz/vim-fresh'
Plugin 'fatih/molokai'
Plugin 'tjammer/blayu.vim'
Plugin 'patstockwell/vim-monokai-tasty'
Plugin 'sonph/onehalf'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'scrooloose/syntastic'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'caksoylar/vim-mysticaltutor'
Plugin 'Raimondi/delimitMate'
Plugin 'Yggdroot/indentLine'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'alvan/vim-closetag'
Plugin 'kien/ctrlp.vim'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'easymotion/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'enricobacis/vim-airline-clock'
Plugin 'lambdalisue/battery.vim'
Plugin 'gko/vim-coloresque'

" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'vim-syntastic/syntastic'
Plugin 'prettier/vim-prettier'

" React.js
Plugin 'maxmellon/vim-jsx-pretty'

" Vue.js
" Plugin 'posva/vim-vue'
Plugin 'leafOfTree/vim-vue-plugin'

" Ruby and Rails
Plugin 'tpope/vim-rails'

" Vim Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Autocompletation
Plugin 'Valloric/YouCompleteMe'

" === END PLUGINS ===

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" 256 colors support for console :) ******************************************
"set background=dark
set t_Co=256
autocmd BufWritePre * :%s/\s\+$//e

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vcr_cassettes\|uploads\|vendor'
let g:gruvbox_termcolors=256

" Syntax | Theme
syntax enable
syn on
"set termguicolors
colorscheme dracula
let g:airline_theme='dracula'

" React config
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']

" Vue config
autocmd BufRead,BufNewFile *.vue setlocal filetype=html
let g:vim_vue_plugin_load_full_syntax = 1
let g:vim_vue_plugin_debug = 1

" Rails config
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
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

let mapleader = ","
nmap <leader>n :bnext<Esc>
nmap <leader>b :bprevious<Esc>
map <leader> <Plug>(easymotion-prefix)

" MarkDown preview
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'

" Battery.vim
set statusline=...%{battery#component()}...
let g:battery#update_statusline = 1 " For statusline.

" Autocompletation
" let g:ycm_min_num_of_chars_for_completion = 3
" let g:ycm_min_num_identifier_candidate_chars = 3
" let g:ycm_enable_diagnostic_highlighting = 0
" set completeopt-=preview
" let g:ycm_add_preview_to_completeopt = 0

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

" vim-closetag

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'
" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1
" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader><cr>'

"Auto pair
let g:AutoPairs = {
\ '`': '`',
\ '''': '''',
\ '{': '}',
\ '{{ ': ' }}',
\ '(': ')',
\ '[': ']',
\ }

" vim-closetag
let g:closetag_filenames = '*.html,*.jsx,*.tsx,*.vue,*.xml,*.xhtml'

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

