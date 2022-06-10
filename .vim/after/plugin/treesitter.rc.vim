if !exists('g:loaded_nvim_treesitter')
  finish
endif

lua <<EOF
require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    'ruby',
    'vue',
    'javascript',
    'html',
    'css',
    'scss',
    'php',
    'json'
  },
}
EOF
