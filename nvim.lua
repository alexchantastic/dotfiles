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
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "ibhagwan/fzf-lua",
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
  "terryma/vim-expand-region",
  "gbprod/yanky.nvim",
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
  },
  "nvim-lualine/lualine.nvim",
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
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
vim.cmd.colorscheme("catppuccin")
require("catppuccin").setup({
  flavour = "mocha",
  integrations = {
    leap = true,
    sandwich = true,
    nvimtree = true,
    treesitter = true,
  },
})

-- Keybinds
vim.keymap.set({ "n", "x" }, "d", "\"_d")
vim.keymap.set({ "n", "x" }, "D", "\"_D")

-- Plugin: nvim-treesitter
if not vim.g.vscode then
  require'nvim-treesitter.configs'.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
    sync_install = false,
    auto_install = true,
    ignore_install = { "javascript" },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  })
end

-- Plugin: fzf-lua
require("fzf-lua").setup({})
vim.keymap.set("n", "<c-P>", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.cmd("command! Ff FzfLua files")
vim.cmd("command! Fb FzfLua buffers")
vim.cmd("command! Fg FzfLua lgrep_curbuf")
vim.cmd("command! Fgg FzfLua live_grep")

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

-- Plugin: lualine.nvim
require("lualine").setup({
  options = {
    icons_enabled = false,
    component_separators = { left = "", right = ""},
    section_separators = { left = "", right = ""},
    theme = "catppuccin",
  },
})

-- Plugin: comment.nvim
require("Comment").setup()

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
