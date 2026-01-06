vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.clipboard = 'unnamedplus'
require('config.lazy')
require('config.cmp')
require('config.options')
require('config.formatting')
require('config.statusline')
require('config.diagnostics')
require('config.keymaps')
