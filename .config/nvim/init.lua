-- Ricardo Villagrana's Neovim Config (Lua)

-- =========================
-- General Settings
-- =========================
vim.opt.number = true
vim.opt.colorcolumn = "120"
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = false
vim.opt.encoding = "utf-8"
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.clipboard = "unnamed"
vim.opt.showmatch = true
vim.opt.swapfile = true
vim.opt.directory = os.getenv("HOME") .. "/.swp/"
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse = ""
vim.opt.termguicolors = true
vim.opt.compatible = false
vim.opt.fillchars = { vert = "│", eob = " " }

vim.g.mapleader = ","

-- =========================
-- Plugin Manager (lazy.nvim recommended)
-- =========================
-- Auto-install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- Colorschemes
  "drewtempelmeyer/palenight.vim",
  "NLKNguyen/papercolor-theme",
  "rebelot/kanagawa.nvim",
  "projekt0n/github-nvim-theme",
  "morhetz/gruvbox",
  { "neanias/everforest-nvim", branch = "main" },

  -- GPT
  "github/copilot.vim",

  -- UI
  "romgrk/barbar.nvim",
  "nvim-tree/nvim-web-devicons",
  "lewis6991/gitsigns.nvim",
  "neomake/neomake",
  "ntpeters/vim-better-whitespace",
  "nvim-lualine/lualine.nvim",
  "nvim-tree/nvim-tree.lua",

  -- Functionality
  "Yggdroot/indentLine",
  "jiangmiao/auto-pairs",
  "ludovicchabant/vim-gutentags",
  "mattn/emmet-vim",
  "nvim-lua/plenary.nvim",
  { "junegunn/fzf", build = function() vim.fn["fzf#install"]() end },
  "junegunn/fzf.vim",
  { "nvim-telescope/telescope.nvim", tag = "0.1.8" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "scrooloose/nerdcommenter",
  "terryma/vim-multiple-cursors",
  "tpope/vim-endwise",
  "tpope/vim-fugitive",
  "tpope/vim-repeat",
  "tpope/vim-sensible",
  "tpope/vim-surround",
  "vim-airline/vim-airline",
  "vim-airline/vim-airline-themes",
  "zivyangll/git-blame.vim",

  -- Laravel / PHP
  { "StanAngeloff/php.vim", ft = "php" },
  { "jwalton512/vim-blade", ft = "php" },
  { "joonty/vim-xdebug", ft = "php" },

  -- JavaScript
  { "jelera/vim-javascript-syntax", ft = { "js", "jsx", "vue" } },
  { "kchmck/vim-coffee-script", ft = "coffee" },
  { "leafgarland/typescript-vim", ft = "ts" },
  { "maxmellon/vim-jsx-pretty", ft = { "js", "jsx", "mdx", "vue" } },
  { "pangloss/vim-javascript", ft = { "js", "jsx", "mdx", "vue" } },
  { "posva/vim-vue", ft = { "js", "jsx", "vue" } },
  { "yardnsm/vim-import-cost", build = "npm install", ft = { "js", "jsx", "vue", "ts" } },

  -- Ruby
  { "ngmy/vim-rubocop", ft = "rb" },
  { "tpope/vim-rails", ft = "rb" },
  { "thoughtbot/vim-rspec", ft = "rb" },

  -- Python
  { "nvie/vim-flake8", ft = "python" },
  -- { "microsoft/pyright", ft = "python" },

  -- Elixir / Phoenix
  { "elixir-editors/vim-elixir", ft = "ex" },

  -- Rust
  { "rust-lang/rust.vim", ft = "rs" },

  -- Other
  { "cespare/vim-toml", ft = "toml" },
  { "mustache/vim-mustache-handlebars", ft = "handlebars" },
  { "amadeus/vim-mjml", ft = "mjml" },
  "jparise/vim-graphql",
})

-- =========================
-- Plugin Config
-- =========================
require("lualine").setup()
require("nvim-tree").setup()
require("gitsigns").setup()

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
      },
    },
  },
})

require("nvim-treesitter.configs").setup({
  indent = { enable = true },
})

-- =========================
-- Keymaps
-- =========================
local map = vim.keymap.set
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
map("n", "<Leader>i", "<cmd>call gitblame#echo()<CR>")
map("n", "<Leader>g", "<cmd>Git blame<CR>")

map("n", "<C-p>", "<cmd>Telescope find_files<CR>")
map("n", "<C-s>", "<cmd>Telescope live_grep<CR>")
map("n", "<C-B>", "<cmd>Telescope buffers<CR>")
map("n", "<C-t>", "<cmd>tabedit %<CR>")
map("n", "<C-c>", "<cmd>Rg<CR>")

map("n", "<C-k>", ":m .-2<CR>==")
map("n", "<C-j>", ":m .+1<CR>==")
map("v", "<C-k>", ":m '<-2<CR>gv=gv")
map("v", "<C-j>", ":m '>+1<CR>gv=gv")

map("n", "<leader>bp", [[/binding.*\|debugger\|byebug\|console\..*\|dd(.*)\|var_dump(.*)\|var_dump<CR>]])
map("n", "<leader>e", function() vim.lsp.buf.format() end)
map("n", "<leader>r", "<cmd>source ~/.config/nvim/init.lua<CR>")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<C-u>", "<cmd>bprevious<CR>")
map("n", "<C-i>", "<cmd>bnext<CR>")
map("n", "<C-o>", "<cmd>bnext<CR>")
map("n", "<C-x>", "<cmd>BufferClose<CR>")

map("n", "<leader>t", "<cmd>NvimTreeToggle<CR>")
map("n", "<leader>s", "<cmd>NvimTreeFindFile<CR>")
map("n", "<leader>f", "<cmd>BufferCloseAllButVisible<CR>")
map("n", "<leader>m", [[/=======\|<<<<<<< .*\|>>>>>>> .*<CR>]])
map("n", "<leader>1", "<cmd>Copilot enable<CR> | <cmd>Copilot status<CR>")
map("n", "<leader>0", "<cmd>Copilot disable<CR> | <cmd>Copilot status<CR>")

-- =========================
-- Colorscheme
-- =========================
vim.cmd.colorscheme("kanagawa")
