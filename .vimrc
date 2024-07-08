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
" set mouse=a
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
  Plug 'bluz71/vim-nightfly-guicolors'
  Plug 'catppuccin/nvim', {'as': 'catppuccin'}
  Plug 'cocopon/iceberg.vim'
  Plug 'glepnir/oceanic-material'
  Plug 'jsit/toast.vim'
  Plug 'morhetz/gruvbox'
  Plug 'projekt0n/github-nvim-theme'
  " New
  Plug 'rose-pine/neovim', {'as': 'rose-pine'}
  Plug 'EdenEast/nightfox.nvim'

  " === COLORSCHEMES ===
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'cocopon/iceberg.vim'
  Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }
  Plug 'rebelot/kanagawa.nvim'

  " === GPT ===
  Plug 'github/copilot.vim'
  " Plug 'MunifTanjim/nui.nvim'
  " Plug 'dpayne/CodeGPT.nvim'

  " === Tools ===
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'Yggdroot/indentLine'
  Plug 'airblade/vim-gitgutter'
  Plug 'akinsho/bufferline.nvim'
  Plug 'ervandew/supertab'
  Plug 'eslint/eslint'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'mattn/emmet-vim'
  Plug 'neomake/neomake'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'ruanyl/vim-fixmyjs'
  Plug 'ryanoasis/vim-devicons'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree'
  " Plug 'scrooloose/syntastic'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'zivyangll/git-blame.vim'

  " === Tailwind CSS ===
  Plug 'laytan/tailwind-sorter.nvim', { 'do': 'cd formatter && npm ci && npm run build' }

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
  Plug 'thoughtbot/vim-rspec'

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
require('tailwind-sorter').setup()
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
EOF

let mapleader = ","

nnoremap <leader>fp <cmd>Telescope find_files<cr>
nnoremap <leader>fs <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <Leader>i :<C-u>call gitblame#echo()<CR>
nnoremap <Leader>g :Git blame<Esc>

" noremap <C-p> :FZF<CR>
noremap <C-p> :Files<CR>
noremap <C-s> :Rg<CR>
noremap <C-t> :tabedit %<CR>

nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv

nmap <silent> <leader>mc <ESC>/\v^[<=>]{7}( .*\|$)<CR>
nmap <silent> <leader>bp <ESC>/binding.*\\|debugger\\|byebug\\|console\..*\\|dd(.*)\\|var_dump(.*)\\|var_dump<CR>
nmap <leader>e :lua vim.lsp.buf.format()<CR>

nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)
nmap <leader>c :term ++curwin<CR>
nmap <leader>r :source ~/.config/nvim/init.vim<CR>
nmap <leader>.r :! cargo run<CR>
nmap <leader>.rb :! bundle<CR>
nmap <leader>.jn :! npm install<CR>
nmap <leader>.jy :! yarn<CR>
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
nmap <C-u> :bprevious<Esc>
nmap <C-i> :bnext<Esc>
nmap <C-o> :bnext<Esc>
map <leader> <Plug>(easymotion-prefix)
map <leader>t :NERDTreeToggle<Enter>
map <leader>m /=======\\|<<<<<<< .*\\|>>>>>>> .*<CR>
map <leader>1 :Copilot enable<Enter> :Copilot status<Enter>
map <leader>0 :Copilot disable<Enter> :Copilot status<Enter>

" RSpec
let g:rspec_command = "!bundle exec rspec --color {spec}"

" RSpec.vim mappings
map <Leader>sc :call RunCurrentSpecFile()<CR>
map <Leader>sn :call RunNearestSpec()<CR>
map <Leader>sl :call RunLastSpec()<CR>
map <Leader>sa :call RunAllSpecs()<CR>

" Custom commands
command ThemeNightfly            execute ':colorscheme nightfly | :set background=dark'
command ThemeIcebergLight        execute ':colorscheme iceberg | :set background=light'
command ThemeIcebergDark         execute ':colorscheme iceberg | :set background=dark'
command ThemeGruvboxLight        execute ':colorscheme gruvbox | :set background=light'
command ThemeGruvboxDark         execute ':colorscheme gruvbox | :set background=dark'
command ThemePalenight           execute ':colorscheme palenight | :set background=dark'
command ThemePaperColor          execute ':colorscheme PaperColor | :set background=dark'
command ThemePaperColorLight     execute ':colorscheme PaperColor | :set background=light'
command ThemeCatppuccinMacchiato execute 'let g:catppuccin_flavour = "macchiato" | :colorscheme catppuccin'
command ThemeCatppuccinLatte     execute 'let g:catppuccin_flavour = "latte" | :colorscheme catppuccin'
command ThemeCatppuccinFrappe    execute 'let g:catppuccin_flavour = "frappe" | :colorscheme catppuccin'
command ThemeCatppuccinMocha     execute 'let g:catppuccin_flavour = "mocha" | :colorscheme catppuccin'
command ThemeKanagawa            execute ':colorscheme kanagawa'

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" === Syntax | Theme ===
syntax enable
syn on
" set cursorline

" === THEMES ===
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_status_lines = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_uniform_diff_background = 1
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

" onInstall: change gutentags_ctags_executable to the universal-ctags path
set statusline+=%{gutentags#statusline()}
" let g:gutentags_ctags_executable = '/usr/local/Cellar/universal-ctags/p6.0.20230319.0/bin/ctags' " '/usr/bin/ctags'
let g:gutentags_ctags_executable = '/usr/local/bin/ctags'
let g:gutentags_cache_dir = '~/.cache/gutentags'
let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "*.vim/bundle/*"]

if has('nvim') || has('vim')
  call neomake#configure#automake('nrwi', 500)
endif

let g:neosnippet#enable_completed_snippet = 1
let g:deoplete#enable_at_startup = 1

" Automatically rebalance windows when vim is resized
autocmd VimResized * :wincmd =

" GitGutter
let g:gitgutter_grep = 'rg'
highlight! link SignColumn LineNr
highlight GitGutterAdd    ctermfg=2
highlight GitGutterChange ctermfg=5
highlight GitGutterDelete ctermfg=1

" FZF config
let g:fzf_preview_window = 'right:50%'

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

" NERDTree stuff
autocmd StdinReadPre * let s:std_in1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" This add tabs (buffers) on the top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='gruvbox'
hi airline_tabfill ctermbg=NONE guibg=NONE

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
colorscheme kanagawa

" ESLint
let g:ale_linters = { 'javascript': ['eslint'], 'jsx': ['eslint'] }
let g:ale_fixers = { 'javascript': ['eslint'], 'jsx': ['eslint'], 'js': ['eslint'], 'scss': ['prettier'] }
let g:ale_fix_on_save = 1
let g:fixmyjs_engine = 'eslint'
lua << EOF
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.prettier,
  },
})
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
EOF

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

" Emmet
let g:user_emmet_install_global = 1
let g:user_emmet_leader_key='<C-Z>' " CTRL-Z => ,

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

" Reset colors
hi ColorColumn ctermbg=8
hi LineNr ctermfg=239
hi Comment ctermfg=242
hi VertSplit ctermfg=darkgray ctermbg=NONE cterm=NONE
hi Visual ctermbg=238 gui=NONE
hi clear NeomakeMessage
hi clear NeomakeInfo
hi clear NeomakeWarning
hi clear NeomakeError
hi NeomakeMessage cterm=underline gui=underline ctermfg=Black  ctermbg=Green
hi NeomakeInfo    cterm=underline gui=underline ctermfg=Black  ctermbg=White
hi NeomakeWarning cterm=underline gui=underline ctermfg=Black ctermbg=Yellow
hi NeomakeError   cterm=underline gui=underline ctermfg=White ctermbg=Red

if has('nvim')
  set fillchars=vert:\│,eob:\ 
endif
