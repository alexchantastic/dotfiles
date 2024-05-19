-- Behaviors
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.fillchars = { eob = " " }
vim.opt.clipboard = "unnamedplus"
vim.opt.inccommand = "nosplit"
vim.opt.shortmess = "I"
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = true

if not vim.g.vscode then
  vim.opt.showmode = false
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

-- Keymaps
vim.keymap.set({ "n", "x" }, "d", '"_d')
vim.keymap.set({ "n", "x" }, "D", '"_D')
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<c-h>", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true, desc = "Previous Buffer" })
vim.keymap.set("n", "<c-l>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true, desc = "Next Buffer" })

-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
  {
    "nvim-lua/plenary.nvim",
    cond = not vim.g.vscode,
  },
  {
    "nvim-tree/nvim-web-devicons",
    cond = not vim.g.vscode,
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    cond = not vim.g.vscode,
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  {
    "ibhagwan/fzf-lua",
    cond = not vim.g.vscode,
    init = function()
      require("fzf-lua").register_ui_select()
      vim.keymap.set(
        "n",
        "<c-P>",
        "<cmd>lua require('fzf-lua').files()<CR>",
        { silent = true, desc = "Search files" }
      )
      vim.cmd("command! Ff FzfLua files")
      vim.cmd("command! Fb FzfLua buffers")
      vim.cmd("command! Fg FzfLua lgrep_curbuf")
      vim.cmd("command! Fgg FzfLua live_grep")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    cond = not vim.g.vscode,
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            border = "rounded",
          },
        },
      },
      "williamboman/mason-lspconfig.nvim",
    },
    init = function()
      vim.keymap.set(
        "n",
        "gd",
        "<cmd>lua vim.lsp.buf.definition()<CR>",
        { noremap = true, silent = true, desc = "[G]oto [D]efinition" }
      )
      vim.keymap.set(
        "n",
        "gD",
        "<cmd>lua vim.lsp.buf.declaration()<CR>",
        { noremap = true, silent = true, desc = "[G]oto [D]eclaration" }
      )
      vim.keymap.set(
        "n",
        "gr",
        "<cmd>lua vim.lsp.buf.references()<CR>",
        { noremap = true, silent = true, desc = "[G]oto [R]eferences" }
      )
      vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover Documentation" })
    end,
    config = function()
      require("mason").setup()
      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        automatic_installation = true,
      })
      mason_lspconfig.setup_handlers({
        function(server_name)
          local capabilities = require("cmp_nvim_lsp").default_capabilities()
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
      })

      require("lspconfig").lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    cond = not vim.g.vscode,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      {
        "L3MON4D3/LuaSnip",
        lazy = true,
        dependencies = {
          "saadparwaiz1/cmp_luasnip",
        },
      },
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        view = {
          docs = {
            auto_open = true,
          },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({
                  behavior = cmp.ConfirmBehavior.Replace,
                  select = true,
                })
              end
            else
              fallback()
            end
          end),
          ["<C-j>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-k>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    cond = not vim.g.vscode,
    opts = {
      flavour = "mocha",
      integrations = {
        which_key = true,
        barbar = true,
        mason = true,
        lsp_trouble = true,
        neotree = true,
        indent_blankline = {
          enabled = true,
          scope_color = "overlay0",
        },
      },
    },
    init = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cond = not vim.g.vscode,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
        sync_install = false,
        auto_install = true,
        ignore_install = { "javascript" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            node_incremental = "+",
            node_decremental = "_",
          },
        },
      })

      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
  {
    "stevearc/conform.nvim",
    cond = not vim.g.vscode,
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
        yaml = { { "prettierd", "prettier" } },
        markdown = { { "prettierd", "prettier" } },
        ["markdown.mdx"] = { { "prettierd", "prettier" } },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
    init = function()
      vim.cmd("command! Format lua require('conform').format()<CR>")
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },
  "mg979/vim-visual-multi",
  {
    "gbprod/yanky.nvim",
    opts = {},
    init = function()
      vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
      vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
      vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
      vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
      vim.keymap.set("n", "<leader>j", "<Plug>(YankyPreviousEntry)")
      vim.keymap.set("n", "<leader>k", "<Plug>(YankyNextEntry)")
      vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
      vim.cmd("command! Y YankyRingHistory")
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cond = not vim.g.vscode,
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      auto_clean_after_session_restore = true,
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_by_name = {
            ".git",
          },
        },
        follow_current_file = {
          enabled = true,
        },
      },
    },
    init = function()
      vim.keymap.set({ "n", "x" }, "<c-b>", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree" })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    cond = not vim.g.vscode,
    opts = {
      options = {
        icons_enabled = false,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        theme = "catppuccin",
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    cond = not vim.g.vscode,
    opts = {
      indent = {
        char = "│",
      },
      scope = {
        show_start = false,
        show_end = false,
      },
    },
  },
  {
    "folke/trouble.nvim",
    branch = "dev",
    event = "VeryLazy",
    cond = not vim.g.vscode,
    opts = {},
    init = function()
      vim.cmd("command! Tr Trouble diagnostics toggle")
    end,
  },
  {
    "romgrk/barbar.nvim",
    event = "VeryLazy",
    cond = not vim.g.vscode,
    opts = {
      auto_hide = 1,
      icons = {
        separator = {
          left = "",
          right = "",
        },
        separator_at_end = false,
        inactive = {
          separator = {
            left = "",
            right = "",
          }
        }
      },
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
  },
  {
    "rmagatti/auto-session",
    cond = not vim.g.vscode,
    opts = {},
    init = function()
      vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
      vim.cmd("command! Fs Autosession search")
    end,
  },
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.move").setup()
      require("mini.surround").setup({
        mappings = {
          add = "as",
          delete = "ds",
          find = "fs",
          find_left = "Fs",
          highlight = "hs",
          replace = "rs",
          update_n_lines = "ns",
        },
      })
    end,
  },
}, {
  install = {
    colorscheme = { "catppuccin" },
  },
  ui = {
    border = "rounded",
  },
})
