local packer = nil

local function init()
    if packer == nil then
        -- install packer if not present
        local git_repo = 'https://github.com/wbthomason/packer.nvim'
        local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
        if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
            vim.fn.system {
                'git',
                'clone',
                '--depth',
                '1',
                git_repo,
                install_path
            }
        end

        packer = require 'packer'
        packer.init {
            auto_clean = true
        }
    end

    local use = packer.use
    packer.reset()

    -- Packer itself
    -- https://github.com/wbthomason/packer.nvim
    use 'wbthomason/packer.nvim'

    -- Improve startup time for Neovim
    -- https://github.com/lewis6991/impatient.nvim
    use 'lewis6991/impatient.nvim'

    -- Quickstart configs for Nvim LSP
    -- https://github.com/neovim/nvim-lspconfig
    use 'neovim/nvim-lspconfig'

    -- L3MON4D3/LuaSnip: Snippet Engine for Neovim written in Lua
    -- https://github.com/L3MON4D3/LuaSnip
    use 'L3MON4D3/LuaSnip'

    -- A completion plugin for neovim coded in Lua.
    -- https://github.com/hrsh7th/nvim-cmp
    use {
        '/Users/ssiyad/sources/nvim-cmp',
        requires = {
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
                config = function() require 'config.dictionary' end,
                -- ft = {
                --     'gitcommit',
                --     'markdown'
                -- }
            },

            -- luasnip completion source for nvim-cmp
            -- https://github.com/saadparwaiz1/cmp_luasnip
            'saadparwaiz1/cmp_luasnip',

            -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
            'hrsh7th/cmp-nvim-lsp-signature-help'
        },
        config = function() require 'config.cmp' end
    }

    -- Delete/change/add parentheses/quotes/XML-tags/much more with ease
    -- https://github.com/tpope/vim-surround
    use 'tpope/vim-surround'

    -- Git wrapper
    -- https://github.com/tpope/vim-fugitive
    use {
        'tpope/vim-fugitive',
        requires = {
            -- GitHub extension for fugitive.vim
            -- https://github.com/tpope/vim-rhubarb
            'https://github.com/tpope/vim-rhubarb'
        }
    }

    -- comment stuff out
    -- https://github.com/tpope/vim-commentary
    use 'tpope/vim-commentary'

    -- Git integration for buffers
    -- https://github.com/lewis6991/gitsigns.nvim
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require 'config.gitsigns' end
    }

    -- Nvim Treesitter configurations and abstraction layer
    -- https://github.com/nvim-treesitter/nvim-treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require 'config.treesitter' end,
    }

    -- Rainbow parentheses for neovim using treesitter
    -- https://github.com/p00f/nvim-ts-rainbow
    use {
        'p00f/nvim-ts-rainbow',
        requires = {
            'nvim-treesitter/nvim-treesitter',
        }
    }

    -- Find/List
    -- https://github.com/nvim-telescope/telescope.nvim
    use {
        {
            'nvim-telescope/telescope.nvim',
            requires = {
                -- lua utils
                -- https://github.com/nvim-lua/plenary.nvim/
                'nvim-lua/plenary.nvim'
            },
            cmd = 'Telescope',
            config = function() require 'config.telescope' end
        },

        -- Telescope.nvim extension that offers intelligent prioritization when
        -- selecting files from editing history
        -- https://github.com/nvim-telescope/telescope-frecency.nvim
        {
            'nvim-telescope/telescope-frecency.nvim',
            requires = {
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
            requires = {
                'nvim-telescope/telescope.nvim'
            },
            run = 'make',
            after = 'telescope.nvim',
            config = function() require('telescope').load_extension('fzf') end
        },
    }

    -- A better annotation generator. Supports multiple languages and annotation conventions
    -- https://github.com/danymat/neogen
    use {
        "danymat/neogen",
        requires = {
            "nvim-treesitter/nvim-treesitter"
        },
        config = function() require('config.neogen') end,
    }

    -- Neovim plugin to preview the contents of the registers
    -- https://github.com/tversteeg/registers.nvim
    use 'tversteeg/registers.nvim'

    -- lua `fork` of vim-web-devicons for neovim
    -- https://github.com/kyazdani42/nvim-web-devicons
    use {
        'kyazdani42/nvim-web-devicons',
        config = function() require 'nvim-web-devicons' .setup {} end
    }

    -- A file explorer tree for neovim written in lua
    -- https://github.com/kyazdani42/nvim-tree.lua
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function() require 'config.tree' end
    }

    -- autopairs for neovim
    -- https://github.com/windwp/nvim-autopairs
    use {
        'windwp/nvim-autopairs',
        config = function() require 'config.autopairs' end
    }

    -- Automatic indentation style detection
    -- https://github.com/NMAC427/guess-indent.nvim
    use {
        'nmac427/guess-indent.nvim',
        config = function() require 'guess-indent' .setup {} end,
    }

    -- Indent guides
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function() require 'config.blankline' end
    }

    -- Hlsearch Lens for Neovim
    -- https://github.com/kevinhwang91/nvim-hlslens
    use {
        'kevinhwang91/nvim-hlslens',
        config = function() require 'hlslens' .setup() end,
    }

    -- A good theme, I guess
    -- https://github.com/catppuccin/nvim
    use {
        'catppuccin/nvim',
        config = function() require 'config.theme' end
    }

    -- fast and easy to configure neovim statusline plugin
    -- https://github.com/nvim-lualine/lualine.nvim
    use {
        'nvim-lualine/lualine.nvim',
        config = function() require 'config.lualine' end
    }

    -- display hex colors
    -- https://github.com/norcalli/nvim-colorizer.lua
    use {
        'norcalli/nvim-colorizer.lua',
        ft = {
            'css',
            'html'
        },
        config = function() require 'config.colorizer' end
    }

    -- Highlight, list and search todo comments
    -- https://github.com/folke/todo-comments.nvim
    use {
        'folke/todo-comments.nvim',
        requires = {
            -- lua utils
            -- https://github.com/nvim-lua/plenary.nvim/
            'nvim-lua/plenary.nvim'
        },
        config = function() require 'todo-comments' .setup {} end
    }

    -- A powerful grammar checker for Vim using LanguageTool.
    -- https://github.com/rhysd/vim-grammarous
    use {
        'rhysd/vim-grammarous'
    }

    -- markdown preview plugin for (neo)vim
    -- https://github.com/iamcco/markdown-preview.nvim
    use {
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() end,
    }
end

local plugins = setmetatable({}, {
    __index = function(_, key)
        init()
        return packer[key]
    end,
})

return plugins

