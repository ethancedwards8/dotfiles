local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables

vim.o.syntax = "enable"
vim.wo.number = true
vim.wo.relativenumber = true

g.rooter_patterns = { '.git'}
g.tex_flavor = 'latex'

cmd 'packadd paq-nvim'               -- load the package manager
local paq = require('paq-nvim').paq  -- a convenient alias
paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself
paq {'junegunn/fzf', run = fn['fzf#install']}
paq {'junegunn/fzf.vim'}
paq {'airblade/vim-rooter'}
paq {'tpope/vim-commentary'}
paq {'ap/vim-css-color'}
paq {'tpope/vim-fugitive'}
paq {'vifm/vifm.vim'}
paq {'itchyny/lightline.vim'}
paq {'machakann/vim-highlightedyank'}
paq {'preservim/nerdtree'}
paq {'lervag/vimtex'}
paq {'LnL7/vim-nix'}
g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup
