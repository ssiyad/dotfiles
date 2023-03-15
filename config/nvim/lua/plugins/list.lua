return {
    -- A good theme, I guess
    -- https://github.com/catppuccin/nvim
    {
        'catppuccin/nvim',
        config = function() require('config.theme') end
    },

    -- Quickstart configs for Nvim LSP
    -- https://github.com/neovim/nvim-lspconfig
    'neovim/nvim-lspconfig',

    -- A completion plugin for neovim coded in Lua.
    -- https://github.com/hrsh7th/nvim-cmp
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- nvim-cmp source for neovim builtin LSP client
            -- https://github.com/hrsh7th/cmp-nvim-lsp
            'hrsh7th/cmp-nvim-lsp',

            -- nvim-cmp source for buffer words
            -- https://github.com/hrsh7th/cmp-buffer
            'hrsh7th/cmp-buffer',

            -- nvim-cmp source for path
            -- https://github.com/hrsh7th/cmp-path
            'hrsh7th/cmp-path',

            -- nvim-cmp source for vim's cmdline
            -- https://github.com/hrsh7th/cmp-cmdline
            'hrsh7th/cmp-cmdline',

            -- nvim-cmp source for dictionary.
            -- https://github.com/uga-rosa/cmp-dictionary
            {
                'uga-rosa/cmp-dictionary',
                config = function() require('config.dictionary') end,
                -- ft = {
                --     'gitcommit',
                --     'markdown'
                -- },
            },

            -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
            'hrsh7th/cmp-nvim-lsp-signature-help'
        },
        config = function() require('config.cmp') end
    },

    {
        -- https://github.com/dcampos/nvim-snippy
        -- Snippet plugin for Neovim written in Lua
        {
            'dcampos/nvim-snippy',
            config = function() require('config.snippy') end,
        },

        -- https://github.com/dcampos/cmp-snippy
        -- nvim-snippy completion source for nvim-cmp
        'dcampos/cmp-snippy',
    },

    -- https://github.com/jcdickinson/codeium.nvim
    -- A native neovim extension for Codeium (Unofficial)
    {
        'jcdickinson/codeium.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = function() require('codeium').setup({}) end,
    },

    -- Add/change/delete surrounding delimiter pairs with ease
    -- https://github.com/kylechui/nvim-surround
    {
        'kylechui/nvim-surround',
        config = function () require('nvim-surround').setup({}) end,
    },

    -- Git wrapper
    -- https://github.com/tpope/vim-fugitive
    {
        'tpope/vim-fugitive',
        dependencies = {
            -- GitHub extension for fugitive.vim
            -- https://github.com/tpope/vim-rhubarb
            'tpope/vim-rhubarb'
        },
    },

    -- Smart and powerful comment plugin for neovim. Supports treesitter,
    -- dot repeat, left-right/up-down motions, hooks, and more
    -- https://github.com/numToStr/Comment.nvim
    {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end,
    },

    -- Git integration for buffers
    -- https://github.com/lewis6991/gitsigns.nvim
    {
        'lewis6991/gitsigns.nvim',
        config = function() require('config.gitsigns') end
    },

    -- Nvim Treesitter configurations and abstraction layer
    -- https://github.com/nvim-treesitter/nvim-treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function() require('config.treesitter') end,
    },

    -- Rainbow parentheses for neovim using treesitter
    -- https://github.com/mrjones2014/nvim-ts-rainbow
    {
        'mrjones2014/nvim-ts-rainbow',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
    },

    -- Find/List
    -- https://github.com/nvim-telescope/telescope.nvim
    {
        {
            'nvim-telescope/telescope.nvim',
            dependencies = {
                -- lua utils
                -- https://github.com/nvim-lua/plenary.nvim/
                'nvim-lua/plenary.nvim'
            },
            config = function() require('config.telescope') end
        },

        -- Live grep with args
        -- https://github.com/nvim-telescope/telescope-live-grep-args.nvim
        {
            'nvim-telescope/telescope-live-grep-args.nvim',
            dependencies = {
                'nvim-telescope/telescope.nvim'
            },
            config = function() require('telescope').load_extension('live_grep_args') end
        },

        -- Telescope.nvim extension that offers intelligent prioritization when
        -- selecting files from editing history
        -- https://github.com/nvim-telescope/telescope-frecency.nvim
        {
            'nvim-telescope/telescope-frecency.nvim',
            dependencies = {
                'nvim-telescope/telescope.nvim',
                'tami5/sqlite.lua'
            },
            after = 'telescope.nvim',
            config = function() require('telescope').load_extension('frecency') end
        },

        -- FZF sorter for telescope written in c
        -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            dependencies = {
                'nvim-telescope/telescope.nvim',
            },
            build = 'make',
            after = 'telescope.nvim',
            config = function() require('telescope').load_extension('fzf') end
        },
    },

    -- A better annotation generator. Supports multiple languages and annotation conventions
    -- https://github.com/danymat/neogen
    {
        "danymat/neogen",
        version = "*",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        },
        config = function() require('config.neogen') end,
    },

    -- Neovim plugin to preview the contents of the registers
    -- https://github.com/tversteeg/registers.nvim
    {
        'tversteeg/registers.nvim',
        config = function() require('config.registers') end,
    },

    -- lua `fork` of vim-web-devicons for neovim
    -- https://github.com/nvim-tree/nvim-web-devicons
    {
        'nvim-tree/nvim-web-devicons',
        config = function() require('nvim-web-devicons').setup({}) end
    },

    -- A file explorer tree for neovim written in lua
    -- https://github.com/nvim-tree/nvim-tree.lua
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function() require('config.tree') end
    },

    -- autopairs for neovim
    -- https://github.com/windwp/nvim-autopairs
    {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup({}) end,
    },

    -- Automatic indentation style detection
    -- https://github.com/NMAC427/guess-indent.nvim
    {
        'nmac427/guess-indent.nvim',
        config = function() require('guess-indent').setup({}) end,
    },

    -- Indent guides
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function() require('config.blankline') end
    },

    -- Hlsearch Lens for Neovim
    -- https://github.com/kevinhwang91/nvim-hlslens
    {
        'kevinhwang91/nvim-hlslens',
        config = function() require('hlslens').setup() end,
    },

    -- fast and easy to configure neovim statusline plugin
    -- https://github.com/nvim-lualine/lualine.nvim
    {
        'nvim-lualine/lualine.nvim',
        config = function() require('config.lualine') end
    },

    -- display hex colors
    -- https://github.com/norcalli/nvim-colorizer.lua
    {
        'norcalli/nvim-colorizer.lua',
        config = function() require('config.colorizer') end
    },

    -- Highlight, list and search todo comments
    -- https://github.com/folke/todo-comments.nvim
    {
        'folke/todo-comments.nvim',
        dependencies = {
            -- lua utils
            -- https://github.com/nvim-lua/plenary.nvim/
            'nvim-lua/plenary.nvim'
        },
        config = function() require('todo-comments').setup({}) end
    },

    -- A powerful grammar checker for Vim using LanguageTool.
    -- https://github.com/rhysd/vim-grammarous
    {
        'rhysd/vim-grammarous'
    },

    -- markdown preview plugin for (neo)vim
    -- https://github.com/iamcco/markdown-preview.nvim
    {
        'iamcco/markdown-preview.nvim',
        build = function() vim.fn['mkdp#util#install']() end,
    },
}
