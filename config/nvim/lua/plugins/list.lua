return {
  -- A good theme, I guess
  -- https://github.com/catppuccin/nvim
  {
    'catppuccin/nvim',
    config = function()
      require('config.theme')
    end,
  },

  -- Quickstart configs for Nvim LSP
  -- https://github.com/neovim/nvim-lspconfig
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('lsp')
    end,
  },

  -- Autoformat
  -- https://github.com/stevearc/conform.nvim
  {
    'stevearc/conform.nvim',
    config = function()
      require('config.conform')
    end,
  },

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

      -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
      'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = function()
      require('config.cmp')
    end,
  },

  {
    -- https://github.com/dcampos/nvim-snippy
    -- Snippet plugin for Neovim written in Lua
    {
      'dcampos/nvim-snippy',
      config = function()
        require('config.snippy')
      end,
    },

    -- https://github.com/dcampos/cmp-snippy
    -- nvim-snippy completion source for nvim-cmp
    'dcampos/cmp-snippy',
  },

  -- https://github.com/github/copilot.vim
  -- GitHub Copilot for Vim
  {
    'github/copilot.vim',
    config = function()
      require('config.copilot')
    end,
  },

  -- Add/change/delete surrounding delimiter pairs with ease
  -- https://github.com/kylechui/nvim-surround
  {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup({})
    end,
  },

  -- Git wrapper
  -- https://github.com/tpope/vim-fugitive
  {
    'tpope/vim-fugitive',
    dependencies = {
      -- GitHub extension for fugitive.vim
      -- https://github.com/tpope/vim-rhubarb
      'tpope/vim-rhubarb',
    },
  },

  -- Smart and powerful comment plugin for neovim. Supports treesitter,
  -- dot repeat, left-right/up-down motions, hooks, and more
  -- https://github.com/numToStr/Comment.nvim
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },

  -- Git integration for buffers
  -- https://github.com/lewis6991/gitsigns.nvim
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('config.gitsigns')
    end,
  },

  -- Nvim Treesitter configurations and abstraction layer
  -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('config.treesitter')
    end,
  },

  -- Find/List
  -- https://github.com/nvim-telescope/telescope.nvim
  {
    {
      'nvim-telescope/telescope.nvim',
      dependencies = {
        -- lua utils
        -- https://github.com/nvim-lua/plenary.nvim/
        'nvim-lua/plenary.nvim',
      },
      config = function()
        require('config.telescope')
      end,
    },

    -- Live grep with args
    -- https://github.com/nvim-telescope/telescope-live-grep-args.nvim
    {
      'nvim-telescope/telescope-live-grep-args.nvim',
      dependencies = {
        'nvim-telescope/telescope.nvim',
      },
      config = function()
        require('telescope').load_extension('live_grep_args')
      end,
    },

    -- FZF sorter for telescope written in c
    -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      dependencies = {
        'nvim-telescope/telescope.nvim',
      },
      build = 'make',
      config = function()
        require('telescope').load_extension('fzf')
      end,
    },
  },

  -- A better annotation generator. Supports multiple languages and annotation conventions
  -- https://github.com/danymat/neogen
  {
    'danymat/neogen',
    version = '*',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('config.neogen')
    end,
  },

  -- autopairs for neovim
  -- https://github.com/windwp/nvim-autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup({})
    end,
  },

  -- Automatic indentation style detection
  -- https://github.com/NMAC427/guess-indent.nvim
  {
    'nmac427/guess-indent.nvim',
    config = function()
      require('guess-indent').setup({})
    end,
  },

  -- Indent guides
  -- https://github.com/lukas-reineke/indent-blankline.nvim
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('ibl').setup()
    end,
  },

  -- fast and easy to configure neovim statusline plugin
  -- https://github.com/nvim-lualine/lualine.nvim
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('config.lualine')
    end,
  },

  -- markdown preview plugin for (neo)vim
  -- https://github.com/iamcco/markdown-preview.nvim
  {
    'iamcco/markdown-preview.nvim',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },

  -- Edit filesystem like a buffer
  -- https://github.com/stevearc/oil.nvim
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('config.oil')
    end,
  },
}
