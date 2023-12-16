local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- {'nvim-treesitter/nvim-treesitter'},
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    { 'lewis6991/gitsigns.nvim' },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons', 'linrongbin16/lsp-progress.nvim'
        }
    },
    { 'nvim-tree/nvim-web-devicons' },
    { 'williamboman/mason.nvim', build = ':MasonUpdate'},
    { 'williamboman/mason-lspconfig.nvim' },
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    { 'windwp/nvim-autopairs' },
    { 'Djancyp/outline' },
    { 'terrortylor/nvim-comment' },
    -- {'windwp/nvim-ts-autotag'},
    { "akinsho/bufferline.nvim",            dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    {
        'linrongbin16/lsp-progress.nvim',
        event = { 'VimEnter' },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function() require('lsp-progress').setup() end
    },
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
    { "folke/which-key.nvim" },
    { 'hrsh7th/vim-vsnip' },
    { 'hrsh7th/vim-vsnip-integ' },
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },
    -- { 'neoclide/coc.nvim' },
    { 'pocco81/auto-save.nvim' },
    {
        'VonHeikemen/fine-CMDline.nvim',
        dependencies = { 'MunifTanjim/nui.nvim' }
    },
    {
        "kdheepak/lazygit.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "s1n7ax/nvim-window-picker"
        }
    },
    { 'ap/vim-css-color' },
    { 'karb94/neoscroll.nvim' },
    { 'kevinhwang91/nvim-bqf' },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup {}
        end
    },
    {
        'Wansmer/treesj',
        keys = { '<space>m', '<space>j', '<space>s' },
        config = function()
            require('treesj').setup {}
        end,
    }
});
