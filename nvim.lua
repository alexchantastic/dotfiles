-- Lazy
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

-- Plugins
require("lazy").setup({
  {
    "nvim-lua/plenary.nvim",
    cond = not vim.g.vscode,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cond = not vim.g.vscode,
  },
  {
    "williamboman/mason.nvim",
    cond = not vim.g.vscode,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    }
  },
  {
    "neovim/nvim-lspconfig",
    cond = not vim.g.vscode,
  },
  {
    "hrsh7th/nvim-cmp",
    cond = not vim.g.vscode,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", 
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    }
  },
  {
    "L3MON4D3/LuaSnip",
    cond = not vim.g.vscode,
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
    }
  },
  {
    "nvimtools/none-ls.nvim",
    cond = not vim.g.vscode,
  },
  {
    "ibhagwan/fzf-lua",
    cond = not vim.g.vscode,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },
  "machakann/vim-sandwich",
  { "numToStr/Comment.nvim", lazy = false },
  "mg979/vim-visual-multi",
  "gbprod/yanky.nvim",
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    cond = not vim.g.vscode,
  },
  {
    "nvim-lualine/lualine.nvim",
    cond = not vim.g.vscode,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    cond = not vim.g.vscode,
  },
})

-- Behaviors
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

-- Colors
vim.opt.termguicolors = true

-- Text
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = true

-- Theme
if not vim.g.vscode then
  vim.cmd.colorscheme("catppuccin")
  require("catppuccin").setup({
    flavour = "mocha",
    integrations = {
      leap = true,
      sandwich = true,
      nvimtree = true,
      treesitter = true,
      which_key = true,
    },
  })
end

-- Keybinds
vim.keymap.set({ "n", "x" }, "d", "\"_d")
vim.keymap.set({ "n", "x" }, "D", "\"_D")

-- Plugins
if not vim.g.vscode then
  -- Plugin: nvim-treesitter
  require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
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
  
  -- Plugin: mason.nvim
  require("mason").setup()
  local mason_lspconfig = require("mason-lspconfig")
  mason_lspconfig.setup({
    automatic_installation = true,
  })
  mason_lspconfig.setup_handlers({
    function (server_name)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
        })
    end
  })

  -- Plugin: nvim-cmp
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
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.locally_jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
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
    })
  })

  cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" }
    }
  })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" }
    }, {
      { name = "cmdline" }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })
  
  -- Plugin: none-ls.nvim
  local null_ls = require("null-ls")
  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.prettierd,
    },
  })
  vim.cmd("command! Format lua vim.lsp.buf.format()")

  -- Plugin: fzf-lua
  require("fzf-lua").setup({})
  vim.keymap.set("n", "<c-P>", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
  vim.cmd("command! Ff FzfLua files")
  vim.cmd("command! Fb FzfLua buffers")
  vim.cmd("command! Fg FzfLua lgrep_curbuf")
  vim.cmd("command! Fgg FzfLua live_grep")

  -- Plugin: lualine.nvim
  require("lualine").setup({
    options = {
      icons_enabled = false,
      component_separators = { left = "", right = ""},
      section_separators = { left = "", right = ""},
      theme = "catppuccin",
    },
  })

  -- Plugin: indent-blankline.nvim
  require("ibl").setup({
    indent = {
      char = "│",
    },
    scope = {
      show_start = false,
      show_end = false,
    },
  })

  -- Plugin: nvim-tree
  require("nvim-tree").setup({
    filters = { custom = { "^.git$" } },
    renderer = {
      icons = {
        show = {
          file = false,
          folder = false,
          git = false,
        },
        glyphs = {
          folder = {
            arrow_open = "▾",
            arrow_closed = "▸",
            default = "▸",
            open =  "▾",
            empty = "▸",
            empty_open = "▾",
            symlink = "▸",
            symlink_open = "▾",
          },
        },
      },
    },
  })
  vim.cmd("command! T NvimTreeToggle")
end

-- Plugin: yanky.nvim
require("yanky").setup({})
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set("n", "<c-j>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<c-k>", "<Plug>(YankyNextEntry)")
vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
vim.cmd("command! Y YankyRingHistory")

-- Plugin: comment.nvim
require("Comment").setup()
