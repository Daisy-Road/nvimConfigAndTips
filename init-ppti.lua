vim.opt.termguicolors = true
vim.opt.showmode = false

-- Retrieving lazy nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    { "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons", }
    },
    { "romgrk/barbar.nvim", 
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons", }
    },
    { "catppuccin/nvim", name = "catppuccin" },
    { "williamboman/mason.nvim", 
    	lazy = false, 
    },
    { "williamboman/mason-lspconfig.nvim",
        lazy = false,
        dependencies = { "neovim/nvim-lspconfig", }
    },
    { "nvim-treesitter/nvim-treesitter",
    	lazy = false,
    },
    { "nvim-lualine/lualine.nvim",
    	dependencies = { "nvim-tree/nvim-web-devicons", }
    },
    { "hrsh7th/nvim-cmp",
        lazy = true,
        dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", }
    },
    { "L3MON4D3/LuaSnip",
        lazy = false,
        version = "<CurrentMajor>.*",
    },
    { "sbdchd/neoformat",
        cmd = "Neoformat",
    },
    { "jiangmiao/auto-pairs",
        lazy = false,
    },
    { "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep" }
    },
    { "numToStr/FTerm.nvim",
        lazy = true,
    },
}

-- Enabling lazy nvim
require("lazy").setup(plugins, opts)

-- Enabling nvim-tree
require("nvim-tree").setup()

-- Enabling mason
require("mason").setup()

-- Enabling lsp
local lspconfig = require('lspconfig')
lspconfig.clangd.setup {}
vim.lsp.handlers["textDocument/publishDiagnostics"] =      
     vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,{ update_in_insert = true })

-- Setting up lualine status bar
require("lualine").setup({
    options = {
        disabled_filetypes = { 'NvimTree' },
    }
})

-- Setting up Barbar Tab manager for buffers
require("barbar").setup({
    sidebar_filetypes = {
        NvimTree = true 
    },
})

-- Setting up Treesitter for better syntax highlighting
require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

-- Setting cmp for code completion
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
	    require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
	{ name = "luasnip" },
    }, {
        { name = "buffer"},
    }),
})
-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['clangd'].setup {
    capabilities = capabilities
}

-- Setting up appareance
vim.cmd.colorscheme "catppuccin-mocha"

-- Setting up basic configuration
vim.cmd.set "relativenumber"
vim.cmd.set "tabstop=4"
vim.cmd.set "shiftwidth=4"
vim.cmd.set "expandtab"

-- Autocmd
-- Formatting on save with Neoformat command
vim.cmd [[
augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END
]]

-- Mappings

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
vim.g.mapleader = ' '

-- File management
-- Saving
map('n', '<C-s>', '<Cmd>w!<CR>', opts)

-- New files in buffer
map('n', '<leader>fn', '<Cmd>enew<CR>', opts)
map('n', '<leader>e', '<Cmd>NvimTreeToggle<CR>', opts)

-- BufferTabs
map('n', '<S-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<S-l>', '<Cmd>BufferNext<CR>', opts)
map('n', '<leader>c', '<Cmd>BufferClose<CR>', opts)

-- Telescope
vim.keymap.set('n', '<leader>ff', "<Cmd>Telescope find_files<CR>", opts)
vim.keymap.set('n', '<leader>fg', "<Cmd>Telescope live_grep<CR>", opts)
vim.keymap.set('n', '<leader>fb', "<Cmd>Telescope buffers<CR>", opts)
vim.keymap.set('n', '<leader>fh', ":Telescope help_tags<CR>", {})

-- Opening terminal
vim.keymap.set('n', '<F7>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<F7>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
