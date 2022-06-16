local packer = nil
local function init()
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

    if packer == nil then
        packer = require 'packer'
        packer.init {
            disable_commands = true,
            display = {
                open_fn = function()
                    return require('packer.util').float {
                        border = 'none',
                    }
                end
            }
        }
    end

    local use = packer.use
    packer.reset()

    -- Packer itself
    -- https://github.com/wbthomason/packer.nvim
    use 'wbthomason/packer.nvim'

    -- Quickstart configs for Nvim LSP
    -- https://github.com/neovim/nvim-lspconfig
    use 'neovim/nvim-lspconfig' 

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

            -- nvim-cmp source for vim-vsnip
            -- https://github.com/hrsh7th/cmp-vsnip
            'hrsh7th/cmp-vsnip',

            -- Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.
            -- https://github.com/hrsh7th/vim-vsnip
            'hrsh7th/vim-vsnip',

            -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
            'hrsh7th/cmp-nvim-lsp-signature-help'
        },
        config = function() require 'config.lspconfig' end
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
        -- opt = true,
        config = function() require('neogit').setup {} end
    }

    -- Git wrapper
    -- https://github.com/tpope/vim-fugitive
    use {
        'tpope/vim-fugitive',
        cmd = {
            'G',
        },
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

    -- Find/List
    -- https://github.com/nvim-telescope/telescope.nvim
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            -- lua utils
            -- https://github.com/nvim-lua/plenary.nvim/
            'nvim-lua/plenary.nvim'
        },
        config = function() require 'config.telescope' end
    }

    -- (Do)cumentation (Ge)nerator 10+ languages
    -- https://github.com/kkoomen/vim-doge
    use {
        'kkoomen/vim-doge',
        run = ':exec doge#install()'
    }

    -- A file explorer tree for neovim written in lua
    -- https://github.com/kyazdani42/nvim-tree.lua
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            -- lua `fork` of vim-web-devicons for neovim
            -- https://github.com/kyazdani42/nvim-web-devicons
            {
                'kyazdani42/nvim-web-devicons',
                config = function() require 'config.devicons' end
            }
        },
        config = function() require 'config.tree' end
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
    use {
        'kevinhwang91/nvim-hlslens',
        config = function() require 'config.hlslens' end
    }

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
        config = function() require 'config.colorizer' end
    }
end

local plugins = setmetatable({}, {
    __index = function(_, key)
        init()
        return packer[key]
    end,
})

return plugins

