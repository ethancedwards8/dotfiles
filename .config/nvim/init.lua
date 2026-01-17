-- Aliases
local fn = vim.fn
local g = vim.g
local map = vim.api.nvim_set_keymap

--- Basic config

-- Basic settings
vim.cmd('syntax enable')
vim.cmd('set nowrap')
vim.cmd('set tabstop=4 shiftwidth=4 expandtab')
vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.incsearch = true

-- Tab/indentation options
vim.opt.expandtab = true

-- Bar settings
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.ruler = true

-- Undofile
vim.opt.undofile = true

-- Macros
vim.cmd([[
    let @i = 'iSigned-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>'
]])

--- Keymaps

-- Leader
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent=true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Window jupming
vim.api.nvim_set_keymap('n', '<leader>wh', ':wincmd h<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>wj', ':wincmd j<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>wk', ':wincmd k<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>wl', ':wincmd l<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>wc', ':wincmd c<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>wv', ':wincmd v<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ws', ':wincmd s<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>wo', ':wincmd o<CR>', {noremap = true})

-- Explore
vim.api.nvim_set_keymap('n', '<leader>e', ':Explore<CR>', {noremap = true})

-- Jump to last file
vim.api.nvim_set_keymap('n', '<leader><Tab>', ':e #<CR>', {noremap = true})

-- Misc
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {noremap=true})

--- Misc settings

-- Autocmd
-- vim.api.nvim_command('autocmd BufWritePre * :%s/\s\+$//e') FIXME

--- Plugins

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- packages
local plugins = {
        {
            'nvim-mini/mini.pick',
            config = function()
                -- FZF NEW!
                require('mini.pick').setup({
                    mappings = {
                        move_up    = '<C-k>',
                        move_down  = '<C-j>',
                    },
                    options = {
                        content_from_bottom = true,
                    }
                })
                vim.api.nvim_set_keymap('n', '<leader>f', ':Pick files<CR>', {noremap = true})
                vim.o.ignorecase = true
            end
        },

        {
                'airblade/vim-rooter',
                config = function()
                        -- Vim rooter
                        vim.g['rooter_patterns'] = {'.git'}
                end
        },

        {
                'ap/vim-css-color'
        },

        {
                'tpope/vim-fugitive',
                config = function()
                        -- Fugitive mappings
                        vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit<CR>', {noremap=true})
                        vim.api.nvim_set_keymap('n', '<leader>gu', ':Git push<CR>', {noremap=true})
                        vim.api.nvim_set_keymap('n', '<leader>gp', ':Git pull<CR>', {noremap=true})
                        vim.api.nvim_set_keymap('n', '<leader>gd', ':Git diff<CR>', {noremap=true})
                        vim.api.nvim_set_keymap('n', '<leader>gl', ':Git log<CR>', {noremap=true})
                        vim.api.nvim_set_keymap('n', '<leader>gs', ':Git<CR>', {noremap=true})
                end
        },

        {
                'itchyny/lightline.vim'
        },

        {
                'machakann/vim-highlightedyank'
        },

        {
                'preservim/nerdtree',
                config = function()
                        -- Nerdtree
                        vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', {noremap=true})
                end
        },

        {
                'lervag/vimtex',
                config = function()
                        -- latex
                        vim.g['tex_flavor'] = 'latex'

                end
        },

        {
            'kaarmu/typst.vim',
            ft = {'typst'},
            lazy=false,
        },

        {
                'LnL7/vim-nix'
        },

        {
                'm4xshen/autoclose.nvim',
                config = function()
                    require("autoclose").setup()
                end
        },
}

require("lazy").setup(plugins, opts)
