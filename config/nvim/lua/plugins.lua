local packer = nil

local function init()
    if packer == nil then
        -- install packer if not present
        local git_repo = 'https://github.com/wbthomason/packer.nvim'
        local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
        if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
            packer_bootstrap = vim.fn.system {
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

    -- A faster version of filetype.vim
    -- https://github.com/nathom/filetype.nvim
    use "nathom/filetype.nvim" 

    -- Quickstart configs for Nvim LSP
    -- https://github.com/neovim/nvim-lspconfig
    use 'neovim/nvim-lspconfig' 

    -- L3MON4D3/LuaSnip: Snippet Engine for Neovim written in Lua
    -- https://github.com/L3MON4D3/LuaSnip
    use 'L3MON4D3/LuaSnip'

    -- A completion plugin for neovim coded in Lua.
    -- https://github.com/hrsh7th/nvim-cmp
    use {
        'hrsh7th/nvim-cmp',
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

            -- luasnip completion source for nvim-cmp
            -- https://github.com/saadparwaiz1/cmp_luasnip
            'saadparwaiz1/cmp_luasnip',

            -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
            'hrsh7th/cmp-nvim-lsp-signature-help'
        },
        config = function() require 'config.cmp' end
    }

    -- magit for neovim
    -- https://github.com/TimUntersberger/neogit
    use {
        'TimUntersberger/neogit',
        requires = {
            -- lua utils
            -- https://github.com/nvim-lua/plenary.nvim/
            'nvim-lua/plenary.nvim'
        },
        disabled = true,
        config = function() require('neogit').setup {} end
    }

    -- Delete/change/add parentheses/quotes/XML-tags/much more with ease
    -- https://github.com/tpope/vim-surround
    use 'tpope/vim-surround'

    -- Git wrapper
    -- https://github.com/tpope/vim-fugitive
    use 'tpope/vim-fugitive'

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

    -- Find/List
    -- https://github.com/nvim-telescope/telescope.nvim
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            -- lua utils
            -- https://github.com/nvim-lua/plenary.nvim/
            'nvim-lua/plenary.nvim'
        },
        cmd = 'Telescope',
        config = function() require 'config.telescope' end
    }

    -- (Do)cumentation (Ge)nerator 10+ languages
    -- https://github.com/kkoomen/vim-doge
    use {
        'kkoomen/vim-doge',
        run = ':exec doge#install()'
    }

    -- Neovim plugin to preview the contents of the registers
    -- https://github.com/tversteeg/registers.nvim
    use 'tversteeg/registers.nvim'

    -- The undo history visualizer for VIM
    -- https://github.com/mbbill/undotree#usage
    use 'mbbill/undotree'

    -- A file explorer tree for neovim written in lua
    -- https://github.com/kyazdani42/nvim-tree.lua
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            -- lua `fork` of vim-web-devicons for neovim
            -- https://github.com/kyazdani42/nvim-web-devicons
            {
                'kyazdani42/nvim-web-devicons',
                config = function() require 'nvim-web-devicons' .setup {} end
            }
        },
        config = function() require 'config.tree' end
    }

    -- autopairs for neovim
    -- https://github.com/windwp/nvim-autopairs
    use {
        'windwp/nvim-autopairs',
        config = function() require 'config.autopairs' end
    }

    -- Extensible Neovim Scrollbar
    -- https://github.com/petertriho/nvim-scrollbar
    use {
        'petertriho/nvim-scrollbar',
        config = function() require 'config.scrollbar' end
    }

    -- Indent guides
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function() require 'config.blankline' end
    }

    -- Hlsearch Lens for Neovim
    -- https://github.com/kevinhwang91/nvim-hlslens
    use 'kevinhwang91/nvim-hlslens'

    -- A clean, dark Neovim theme written in Lua
    -- https://github.com/folke/tokyonight.nvim
    use {
        'folke/tokyonight.nvim',
        config = function() require 'config.tokyonight' end
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
        config = function() require 'colorizer' setup {} end
    }

    -- Highlight, list and search todo comments
    -- https://github.com/folke/todo-comments.nvim
    use {
        "folke/todo-comments.nvim",
        requires = {
            -- lua utils
            -- https://github.com/nvim-lua/plenary.nvim/
            'nvim-lua/plenary.nvim'
        },
        config = function() require "todo-comments" .setup {} end
    }
end

local plugins = setmetatable({}, {
    __index = function(_, key)
        init()
        return packer[key]
    end,
})

return plugins

