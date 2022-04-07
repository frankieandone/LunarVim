local core_plugins = {
  -- Packer can manage itself as an optional plugin
  { "wbthomason/packer.nvim" },
  { "neovim/nvim-lspconfig" },
  { "tamago324/nlsp-settings.nvim" },
  {
    "jose-elias-alvarez/null-ls.nvim",
  },
  { "antoinemadec/FixCursorHold.nvim" }, -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  {
    "williamboman/nvim-lsp-installer",
  },
  {
    "lunarvim/onedarker.nvim",
    config = function()
      pcall(function()
        if lvim and lvim.colorscheme == "onedarker" then
          require("onedarker").setup()
          lvim.builtin.lualine.options.theme = "onedarker"
        end
      end)
    end,
    disable = lvim.colorscheme ~= "onedarker",
  },
  {
    "rcarriga/nvim-notify",

    config = function()
      require("lvim.core.notify").setup()
    end,
    requires = { "nvim-telescope/telescope.nvim" },
    disable = not lvim.builtin.notify.active or not lvim.builtin.telescope.active,
  },
  { "Tastyep/structlog.nvim" },

  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",

    config = function()
      require("lvim.core.telescope").setup()
    end,
    disable = not lvim.builtin.telescope.active,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    run = "make",
    disable = not lvim.builtin.telescope.active,
  },
  -- Install nvim-cmp, and buffer source as a dependency
  {
    "hrsh7th/nvim-cmp",
    config = function()
      if lvim.builtin.cmp then
        require("lvim.core.cmp").setup()
      end
    end,
    requires = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "rafamadriz/friendly-snippets",
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip/loaders/from_vscode").lazy_load()
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "saadparwaiz1/cmp_luasnip",
  },
  {
    "hrsh7th/cmp-buffer",
  },
  {
    "hrsh7th/cmp-path",
  },
  {
    "folke/lua-dev.nvim",
    module = "lua-dev",
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    -- event = "InsertEnter",
    config = function()
      require("lvim.core.autopairs").setup()
    end,
    disable = not lvim.builtin.autopairs.active,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    branch = vim.fn.has "nvim-0.6" == 1 and "master" or "0.5-compat",
    -- run = ":TSUpdate",
    config = function()
      require("lvim.core.treesitter").setup()
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufReadPost",
  },

  -- NvimTree
  {
    "kyazdani42/nvim-tree.lua",
    -- event = "BufWinOpen",
    -- cmd = "NvimTreeToggle",
    config = function()
      require("lvim.core.nvimtree").setup()
    end,
    disable = not lvim.builtin.nvimtree.active,
  },

  {
    "lewis6991/gitsigns.nvim",

    config = function()
      require("lvim.core.gitsigns").setup()
    end,
    event = "BufRead",
    disable = not lvim.builtin.gitsigns.active,
  },

  -- Whichkey
  {
    "folke/which-key.nvim",
    config = function()
      require("lvim.core.which-key").setup()
    end,
    event = "BufWinEnter",
    disable = not lvim.builtin.which_key.active,
  },

  -- Comments
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require("lvim.core.comment").setup()
    end,
    disable = not lvim.builtin.comment.active,
  },

  -- project.nvim
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("lvim.core.project").setup()
    end,
    disable = not lvim.builtin.project.active,
  },

  -- Icons
  { "kyazdani42/nvim-web-devicons" },

  -- Status Line and Bufferline
  {
    -- "hoob3rt/lualine.nvim",
    "nvim-lualine/lualine.nvim",
    -- "Lunarvim/lualine.nvim",
    config = function()
      require("lvim.core.lualine").setup()
    end,
    disable = not lvim.builtin.lualine.active,
  },

  {
    "akinsho/bufferline.nvim",
    config = function()
      require("lvim.core.bufferline").setup()
    end,
    event = "BufWinEnter",
    disable = not lvim.builtin.bufferline.active,
  },

  -- Debugging
  {
    "mfussenegger/nvim-dap",
    -- event = "BufWinEnter",
    config = function()
      require("lvim.core.dap").setup()
    end,
    disable = not lvim.builtin.dap.active,
  },

  -- Debugger management
  {
    "Pocco81/DAPInstall.nvim",
    -- event = "BufWinEnter",
    -- event = "BufRead",
    disable = not lvim.builtin.dap.active,
  },

  -- alpha
  {
    "goolord/alpha-nvim",
    config = function()
      require("lvim.core.alpha").setup()
    end,
    disable = not lvim.builtin.alpha.active,
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    config = function()
      require("lvim.core.terminal").setup()
    end,
    disable = not lvim.builtin.terminal.active,
  },

  -- SchemaStore
  {
    "b0o/schemastore.nvim",
  },


  -- numb: peek number lines
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true -- Enable 'cursorline' for the window while peeking
      }
    end
  },
  -- nvim-bqf: better quickfix window
  {
    "kevinhwang91/nvim-bqf",
    event = {"BufRead", "BufNew"},
    config = function()
      require("bqf").setup(
        {
          auto_enable = true,
          preview = {
            win_height = 12,
            win_vheight = 12,
            delay_syntax = 80,
            border_chars = {"┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█"}
          },
          func_map = {
            vsplit = "",
            ptogglemode = "z,",
            stoggleup = ""
          },
          filter = {
            fzf = {
              action_for = {["ctrl-s"] = "split"},
              extra_opts = {"--bind", "ctrl-o:toggle-all", "--prompt", "> "}
            }
          }
        }
      )
    end
  },
  -- nvim-spectre: search and replace
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end
  },
  -- vim-matchup: navigate and highlight matching words
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = {method = "popup"}
    end
  },
  -- diffview: git diff in a single tabpage
  {
    "sindrets/diffview.nvim",
    event = "BufRead"
  },
  -- git-blame: show git blame
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end
  },
  -- nvim-ts-autotag: autoclose and autorename html tag
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },
  -- nvim-ts-rainbow: rainbow paranthesis
  {
    "p00f/nvim-ts-rainbow"
  },
  -- lsp-colors: lsp diagnostics highlight groups for non lsp color schemes
  {
    "folke/lsp-colors.nvim",
    event = "BufRead"
  },
  -- nvim-colorizer: color highlighter
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup(
        {"*"},
        {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          rgb_fn = true, -- CSS rgb() and rgba() functions
          hsl_fn = true, -- CSS hsl() and hsla() functions
          css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true -- Enable all CSS *functions*: rgb_fn, hsl_fn
        }
      )
    end
  },
  -- cmp-tabnine: TabNine completion engine for hrsh7th/nvim-cmp
  {
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
    event = "InsertEnter"
  },
  -- goto-preview: previewing goto definition calls
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup {
        width = 120, -- Width of the floating window
        height = 25, -- Height of the floating window
        default_mappings = false, -- Bind default mappings
        debug = false, -- Print debug information
        opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      }
    end
  },
  -- lsp-rooter: cwd to the project's root directory
  {
    "ahmedkhalf/lsp-rooter.nvim",
    event = "BufRead",
    config = function()
      require("lsp-rooter").setup()
    end
  },
  -- lsp_signature.nvim: hint when you type
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "lsp_signature".setup()
    end
  },
  -- -- autosave
  -- {
  --   "Pocco81/AutoSave.nvim",
  --   config = function()
  --     require("autosave").setup()
  --   end,
  -- },

  -- nvim-lastplace: pick up where you left off
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup(
        {
          lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
          lastplace_ignore_filetype = {
            "gitcommit",
            "gitrebase",
            "svn",
            "hgcommit"
          },
          lastplace_open_folds = true
        }
      )
    end
  },
  -- todo-comments.nvim
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end
  },
  -- vim-repeat: enable repeating supported plugin maps with "."
  {"tpope/vim-repeat"},
  -- vim-surround: mappings to delete, change, and add surroundings
  {
    "tpope/vim-surround",
    keys = {"c", "d", "y"}
  },
  -- indent-blankline: indent lines for every line
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
      vim.g.indent_blankline_buftype_exclude = {"terminal"}
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = false
    end
  },
  {
    "watzon/vim-edge-template"
  },
  {
    "alvarosevilla95/luatab.nvim",
    requires = "kyazdani42/nvim-web-devicons"
  },
  {
    "projekt0n/github-nvim-theme",
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle"
  },
  {
    "ThePrimeagen/harpoon"
  },

  {
    "svermeulen/vim-cutlass"
  },

  {
    'Shatur/neovim-ayu'
  },

  {
    'EdenEast/nightfox.nvim'
  },

  {
    'folke/tokyonight.nvim'
  }
}

for _, entry in ipairs(core_plugins) do
  if not os.getenv "LVIM_DEV_MODE" then
    entry["lock"] = true
  end
end

return core_plugins
