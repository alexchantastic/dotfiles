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
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {
    "ibhagwan/fzf-lua",
    config = function()
      require("fzf-lua").setup({})
    end
  },
  "ggandor/leap.nvim",
  "machakann/vim-sandwich",
  "nvim-lualine/lualine.nvim",
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
    sandwich = true
  }
})

-- Plugin: fzf-lua
vim.keymap.set("n", "<c-P>", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set("n", "<c-_>", "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })

-- Plugin: leap
require('leap')
vim.keymap.set({'n', 'x', 'o'}, 'f', '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, 'F', '<Plug>(leap-backward)')

-- Plugin: lualine
require('lualine').setup {
  options = {
      icons_enabled = false,
      component_separators = { left = "", right = ""},
      section_separators = { left = "", right = ""},
      theme = "catppuccin"
  }
}
