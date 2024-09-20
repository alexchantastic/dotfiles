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
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = true
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.scrolloff = 10
vim.opt.splitbelow = true
vim.opt.splitright = true

if not vim.g.vscode then
	vim.opt.showmode = false
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

-- Keymaps
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Go to right window" })
vim.keymap.set("n", "<C-Up>", "<Cmd>resize +2<CR>", { noremap = true, silent = true, desc = "Increase window height" })
vim.keymap.set(
	"n",
	"<C-Down>",
	"<Cmd>resize -2<CR>",
	{ noremap = true, silent = true, desc = "Decrease window height" }
)
vim.keymap.set(
	"n",
	"<C-Left>",
	"<Cmd>vertical resize -2<CR>",
	{ noremap = true, silent = true, desc = "Decrease window width" }
)
vim.keymap.set(
	"n",
	"<C-Right>",
	"<Cmd>vertical resize +2<CR>",
	{ noremap = true, silent = true, desc = "Increase window width" }
)
vim.keymap.set({ "n", "v", "x" }, "d", '"_d', { noremap = true, silent = true, desc = "Delete character" })
vim.keymap.set({ "n", "v", "x" }, "<Leader>d", "d", { noremap = true, silent = true, desc = "Delete character" })
vim.keymap.set({ "n", "v", "x" }, "D", '"_D', { noremap = true, silent = true, desc = "Delete to end of line" })
vim.keymap.set({ "n", "v", "x" }, "<Leader>D", "D", { noremap = true, silent = true, desc = "Delete to end of line" })
vim.keymap.set({ "n", "v", "x" }, "<Leader>x", '"_x', { noremap = true, silent = true, desc = "Cut character" })
vim.keymap.set({ "n", "v", "x" }, "c", '"_c', { noremap = true, silent = true, desc = "Change character" })
vim.keymap.set({ "n", "v", "x" }, "<Leader>c", "c", { noremap = true, silent = true, desc = "Change character" })
vim.keymap.set("n", "<Esc>", function()
	vim.cmd("nohlsearch")

	local flash_state = require("flash.plugins.char").state
	if flash_state ~= nil then
		flash_state:hide()
	end

	for _, win in ipairs(vim.api.nvim_list_wins()) do
		if vim.api.nvim_win_get_config(win).relative == "win" then
			vim.api.nvim_win_close(win, false)
		end
	end
end, { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>bb", "<Cmd>buffer#<CR>", { noremap = true, silent = true, desc = "Alternate buffer" })
vim.keymap.set({ "n", "i" }, "<C-s>", "<Cmd>write<CR>", { noremap = true, silent = true, desc = "Write file" })
vim.keymap.set({ "v", "x" }, "<", "<gv^", { noremap = true, silent = true, desc = "Indent right" })
vim.keymap.set({ "v", "x" }, ">", ">gv^", { noremap = true, silent = true, desc = "Indent left" })

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
		"nvim-tree/nvim-web-devicons",
		cond = not vim.g.vscode,
		event = "VeryLazy",
	},
	{
		"lewis6991/gitsigns.nvim",
		cond = not vim.g.vscode,
		event = "BufReadPost",
		opts = {},
	},
	{
		"folke/which-key.nvim",
		cond = not vim.g.vscode,
		event = "VeryLazy",
		opts = {},
	},
	{
		"ibhagwan/fzf-lua",
		cond = not vim.g.vscode,
		cmd = { "FzfLua", "Fz", "Ff", "Fb", "Fg", "Fgg", "Fs", "Fse", "Fy" },
		keys = {
			{
				"<C-p>",
				mode = { "n" },
				function()
					require("fzf-lua").files()
				end,
				noremap = true,
				silent = true,
				desc = "Search files",
			},
			{
				"<Leader>p",
				mode = { "n" },
				function()
					require("fzf-lua").builtin()
				end,
				noremap = true,
				silent = true,
				desc = "Search commands",
			},
			{
				"<Leader>s",
				mode = { "n" },
				function()
					require("fzf-lua").lsp_document_symbols()
				end,
				noremap = true,
				silent = true,
				desc = "Document symbols",
			},
			{
				"<Leader>ca",
				mode = { "n" },
				function()
					require("fzf-lua").lsp_code_actions()
				end,
				noremap = true,
				silent = true,
				desc = "Code actions",
			},
		},
		config = function()
			require("fzf-lua").setup({
				actions = {
					files = {
						["default"] = require("fzf-lua.actions").file_edit,
					},
				},
			})
			require("fzf-lua").register_ui_select()
			vim.cmd("command! Fz FzfLua builtin")
			vim.cmd("command! Ff FzfLua files")
			vim.cmd("command! Fb FzfLua buffers")
			vim.cmd("command! Fg FzfLua lgrep_curbuf")
			vim.cmd("command! Fgg FzfLua live_grep")
			vim.cmd("command! Fs FzfLua lsp_document_symbols")
			vim.cmd("command! Fca FzfLua lsp_code_actions")
			vim.cmd("command! Fse Autosession search")
		end,
	},
	{
		"williamboman/mason.nvim",
		cond = not vim.g.vscode,
		lazy = true,
		opts = {
			ui = {
				border = "rounded",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		cond = not vim.g.vscode,
		event = "BufReadPost",
		version = "*",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
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

			vim.g.diagnostic_virtual_text = false
			vim.diagnostic.config({
				virtual_text = vim.g.diagnostic_virtual_text,
				underline = true,
				float = {
					border = "rounded",
				},
			})

			vim.keymap.set(
				"n",
				"gd",
				"<Cmd>lua vim.lsp.buf.definition()<CR>",
				{ noremap = true, silent = true, desc = "Goto definition" }
			)
			vim.keymap.set(
				"n",
				"gD",
				"<Cmd>lua vim.lsp.buf.declaration()<CR>",
				{ noremap = true, silent = true, desc = "Goto declaration" }
			)
			vim.keymap.set(
				"n",
				"gr",
				"<Cmd>lua vim.lsp.buf.references()<CR>",
				{ noremap = true, silent = true, desc = "Goto references" }
			)
			vim.keymap.set("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover documentation" })
			vim.keymap.set("n", "KK", "<Cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Hover diagnostic" })
			vim.keymap.set("n", "<Leader>tt", function()
				vim.g.diagnostic_virtual_text = not vim.g.diagnostic_virtual_text
				vim.diagnostic.config({
					virtual_text = vim.g.diagnostic_virtual_text,
				})
			end, { silent = true, noremap = true, desc = "Toggle diagnostics virtual text" })
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		cond = not vim.g.vscode,
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
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
							cmp.confirm({
								behavior = cmp.ConfirmBehavior.Replace,
								select = true,
							})
						else
							fallback()
						end
					end),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.confirm({
								behavior = cmp.ConfirmBehavior.Replace,
								select = true,
							})
						else
							fallback()
						end
					end),
					["<C-j>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-k>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
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
		event = "VeryLazy",
		opts = {
			flavour = "mocha",
			styles = {
				conditionals = {},
			},
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
		event = { "BufReadPost", "BufNewFile" },
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
		event = "BufWritePre",
		cmd = { "ConformInfo", "Format", "FormatDisable", "FormatEnable" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettierd", "prettier" },
					javascriptreact = { "prettierd", "prettier" },
					typescript = { "prettierd", "prettier" },
					typescriptreact = { "prettierd", "prettier" },
					css = { "prettierd", "prettier" },
					html = { "prettierd", "prettier" },
					json = { "prettierd", "prettier" },
					yaml = { "prettierd", "prettier" },
					markdown = { "prettierd", "prettier" },
					["markdown.mdx"] = { "prettierd", "prettier" },
				},
				format_on_save = function(bufnr)
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end
					return { timeout_ms = 500, lsp_format = "fallback" }
				end,
			})

			vim.api.nvim_create_user_command("Format", function(args)
				local range = nil
				if args.count ~= -1 then
					local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
					range = {
						start = { args.line1, 0 },
						["end"] = { args.line2, end_line:len() },
					}
				end
				require("conform").format({ async = true, lsp_format = "fallback", range = range })
			end, { range = true })

			vim.api.nvim_create_user_command("FormatDisable", function(args)
				if args.bang then
					vim.b.disable_autoformat = true
				else
					vim.g.disable_autoformat = true
				end
			end, {
				desc = "Disable autoformat-on-save",
				bang = true,
			})

			vim.api.nvim_create_user_command("FormatEnable", function()
				vim.b.disable_autoformat = false
				vim.g.disable_autoformat = false
			end, {
				desc = "Enable autoformat-on-save",
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		cond = not vim.g.vscode,
		event = "BufWritePost",
		cmd = "Lint",
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				javascript = { "eslint" },
				javascriptreact = { "eslint" },
				typescript = { "eslint" },
				typescriptreact = { "eslint" },
			}
			vim.cmd("command! Lint lua require('lint').try_lint()<CR>")
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
	{
		"folke/flash.nvim",
		event = "BufReadPost",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "o" },
				function()
					require("flash").jump()
				end,
				noremap = true,
				silent = true,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "o" },
				function()
					require("flash").treesitter()
				end,
				noremap = true,
				silent = true,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = { "o" },
				function()
					require("flash").remote()
				end,
				noremap = true,
				silent = true,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				noremap = true,
				silent = true,
				desc = "Treesitter Search",
			},
			{
				"<C-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				noremap = true,
				silent = true,
				desc = "Toggle Flash Search",
			},
		},
	},
	{
		"smjonas/live-command.nvim",
		cmd = { "Preview", "Norm", "G" },
		config = function()
			require("live-command").setup({
				commands = {
					Norm = { cmd = "norm" },
					G = { cmd = "g" },
				},
			})
		end,
	},
	{
		"mg979/vim-visual-multi",
		event = "BufReadPost",
	},
	{
		"gbprod/yanky.nvim",
		cmd = "Fy",
		keys = {
			{
				"y",
				"<Plug>(YankyYank)",
				mode = { "n", "x" },
				noremap = true,
				silent = true,
				desc = "Yank text",
			},
			{
				"p",
				"<Plug>(YankyPutAfter)",
				mode = { "n", "x" },
				noremap = true,
				silent = true,
				desc = "Put yanked text after cursor",
			},
			{
				"P",
				"<Plug>(YankyPutBefore)",
				mode = { "n", "x" },
				noremap = true,
				silent = true,
				desc = "Put yanked text before cursor",
			},
			{
				"gp",
				"<Plug>(YankyGPutAfter)",
				mode = { "n", "x" },
				noremap = true,
				silent = true,
				desc = "Put yanked text after selection",
			},
			{
				"gP",
				"<Plug>(YankyGPutBefore)",
				mode = { "n", "x" },
				noremap = true,
				silent = true,
				desc = "Put yanked text before selection",
			},
			{
				"<Leader>j",
				"<Plug>(YankyPreviousEntry)",
				noremap = true,
				silent = true,
				desc = "Select previous entry through yank history",
			},
			{
				"<Leader>k",
				"<Plug>(YankyNextEntry)",
				noremap = true,
				silent = true,
				desc = "Select next entry through yank history",
			},
		},
		config = function()
			require("yanky").setup()
			vim.cmd("command! Fy YankyRingHistory")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cond = not vim.g.vscode,
		cmd = "Neotree",
		keys = {
			{
				"<Leader>e",
				mode = { "n", "x" },
				function()
					require("neo-tree.command").execute({ toggle = true })
				end,
				noremap = true,
				silent = true,
				desc = "Toggle Neo-tree",
			},
		},
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
	},
	{
		"nvim-lualine/lualine.nvim",
		cond = not vim.g.vscode,
		event = "VeryLazy",
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
		event = "BufReadPost",
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
		cond = not vim.g.vscode,
		keys = {
			{
				"<Leader>t",
				mode = { "n" },
				"<Cmd>Trouble diagnostics toggle focus=true<CR>",
				noremap = true,
				silent = true,
				desc = "Toggle Trouble",
			},
		},
		cmd = { "Trouble", "Tr" },
		config = function()
			require("trouble").setup()
			vim.cmd("command! Tr Trouble diagnostics toggle focus=true")
		end,
	},
	{
		"romgrk/barbar.nvim",
		cond = not vim.g.vscode,
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		config = function()
			require("barbar").setup({
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
						},
					},
				},
			})
			vim.keymap.set(
				"n",
				"<S-h>",
				"<Cmd>BufferPrevious<CR>",
				{ noremap = true, silent = true, desc = "Previous buffer" }
			)
			vim.keymap.set("n", "<S-l>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
			vim.keymap.set(
				{ "n", "i" },
				"<C-w>",
				"<Cmd>BufferClose<CR>",
				{ noremap = true, silent = true, desc = "Close buffer" }
			)
			vim.keymap.set(
				"n",
				"<Leader>br",
				"<Cmd>BufferRestore<CR>",
				{ noremap = true, silent = true, desc = "Restore buffer" }
			)
			vim.keymap.set(
				"n",
				"<Leader>bc",
				"<Cmd>BufferClose<CR>",
				{ noremap = true, silent = true, desc = "Close buffer" }
			)
			vim.keymap.set(
				"n",
				"<Leader>ba",
				"<Cmd>BufferCloseAllButPinned<CR>",
				{ noremap = true, silent = true, desc = "Close all buffers" }
			)
			vim.keymap.set(
				"n",
				"<Leader>bp",
				"<Cmd>BufferPick<CR>",
				{ noremap = true, silent = true, desc = "Pick buffer" }
			)
		end,
	},
	{
		"rmagatti/auto-session",
		cond = not vim.g.vscode,
		config = function()
			require("auto-session").setup()
			vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
		end,
	},
	{
		"echasnovski/mini.nvim",
		event = "BufReadPost",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		config = function()
			require("mini.move").setup()

			require("mini.extra").setup()

			local spec = require("mini.ai").gen_spec
			local extra_spec = require("mini.extra").gen_ai_spec
			require("mini.ai").setup({
				custom_textobjects = {
					F = spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
					A = spec.treesitter({ a = "@attribute.outer", i = "@attribute.inner" }),
					C = spec.treesitter({ a = "@comment.outer", i = "@comment.inner" }),
					g = extra_spec.buffer(),
					d = extra_spec.diagnostic(),
					i = extra_spec.indent(),
					L = extra_spec.line(),
					["#"] = extra_spec.number(),
				},
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = "BufReadPost",
		dependencies = {
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				opts = {
					enable_autocmd = false,
				},
			},
		},
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		event = "BufReadPost",
		opts = {},
	},
	{
		"windwp/nvim-ts-autotag",
		cond = not vim.g.vscode,
		event = {
			"BufReadPost *.jsx",
			"BufReadPost *.tsx",
			"BufReadPost *.html",
			"BufReadPost *.md",
			"BufReadPost *.mdx",
		},
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		cond = not vim.g.vscode,
		event = "InsertEnter",
		opts = {},
	},
}, {
	install = {
		colorscheme = { "catppuccin" },
	},
	ui = {
		border = "rounded",
	},
})
