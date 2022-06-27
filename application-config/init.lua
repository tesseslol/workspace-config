--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
lvim.plugins = {
  {
    "camspiers/snap",
    rocks = "fzy",
    config = function()
      local snap = require "snap"
      local layout = snap.get("layout").bottom
      local file = snap.config.file:with { consumer = "fzy", layout = layout }
      local vimgrep = snap.config.vimgrep:with { layout = layout }
      snap.register.command("find_files", file { producer = "ripgrep.file" })
      snap.register.command("buffers", file { producer = "vim.buffer" })
      snap.register.command("oldfiles", file { producer = "vim.oldfile" })
      snap.register.command("live_grep", vimgrep {})
    end,
  },
  { "lunarvim/colorschemes" },
  { "folke/tokyonight.nvim" }, {
    "ray-x/lsp_signature.nvim",
    config = function() require "lsp_signature".on_attach() end,
    event = "BufRead"
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "tpope/vim-surround",
    keys = { "c", "d", "y" }
    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- end
  },
  {
    "felipec/vim-sanegx",
    event = "BufRead",
  },
  { "tpope/vim-repeat" },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },

  {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  }, {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
      vim.g.indent_blankline_buftype_exclude = { "terminal" }
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = false
    end
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {
        width = 120; -- Width of the floating window
        height = 25; -- Height of the floating window
        default_mappings = false; -- Bind default mappings
        debug = false; -- Print debug information
        opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      }
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            'class',
            'function',
            'method',
          },
        },
      }
    end
  },
  {
    "p00f/nvim-ts-rainbow",
  },

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "gelguy/wilder.nvim"
  },
  { "mbbill/undotree" },
  {
    'sudormrfbin/cheatsheet.nvim',

    requires = {
      { 'nvim-telescope/telescope.nvim' },
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
    }
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  { "lukas-reineke/cmp-rg",
    -- init.lua
    config = function() require("packer").startup(
        function()
          use "lukas-reineke/cmp-rg"
        end
      )
    end
  },
  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
  },
  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
  },
  { "ThePrimeagen/harpoon" },
  { "sbdchd/neoformat" },
  { "nvim-telescope/telescope-file-browser.nvim" },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "hrsh7th/cmp-cmdline",
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
  {
    "monaqa/dial.nvim",
    event = "BufRead",
    config = function()
      local dial = require "dial"
      vim.cmd [[
    nmap <C-a> <Plug>(dial-increment)
      nmap <C-x> <Plug>(dial-decrement)
      vmap <C-a> <Plug>(dial-increment)
      vmap <C-x> <Plug>(dial-decrement)
      vmap g<C-a> <Plug>(dial-increment-additional)
      vmap g<C-x> <Plug>(dial-decrement-additional)
    ]]

      dial.augends["custom#boolean"] = dial.common.enum_cyclic {
        name = "boolean",
        strlist = { "true", "false" },
      }
      table.insert(dial.config.searchlist.normal, "custom#boolean")

      -- For Languages which prefer True/False, e.g. python.
      dial.augends["custom#Boolean"] = dial.common.enum_cyclic {
        name = "Boolean",
        strlist = { "True", "False" },
      }
      table.insert(dial.config.searchlist.normal, "custom#Boolean")
    end,
  },

  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },
  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },
  {
    "nvim-telescope/telescope-fzy-native.nvim",
    run = "make",
    event = "BufRead",
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  -- my other config
  {
    'David-Kunz/cmp-npm',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  },
  {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" }
    }
  },
  { "beauwilliams/focus.nvim", config = function() require("focus").setup() end },
  {
    'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
  },
  { "petertriho/nvim-scrollbar" },
  { "Djancyp/cheat-sheet",
    config = function()
      require("cheat-sheet").setup({
        auto_fill = {
          current_word = false, filetype = true,
        },

        main_win = {
          style = "minimal",
          border = "double",
        },
        input_win = {
          style = "minimal",
          border = "double",
        },

      })
    end, },

  {
    "luukvbaal/stabilize.nvim",
    config = function() require("stabilize").setup() end
  },
  { "tami5/sqlite.lua" },

  -- {'subnut/nvim-ghost.nvim' },
  -- ':call nvim_ghost#installer#install()'}

  {
    "danymat/neogen",
    config = function()
      require('neogen').setup()
    end,
    requires = "nvim-treesitter/nvim-treesitter",
  },
  { "johmsalas/text-case.nvim" },
  {
    'nmac427/guess-indent.nvim',
    config = function() require('guess-indent').setup() end,
  },
  { 'anuvyklack/keymap-layer.nvim' },
  { 'anuvyklack/hydra.nvim',
    requires = 'anuvyklack/keymap-layer.nvim' -- needed only for pink hydras
  },
  { 'sindrets/winshift.nvim' },
  { 'jlanzarotta/bufexplorer' },
  { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
  { -- need to learn
    'ray-x/navigator.lua',
    requires = {
      { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
      { 'neovim/nvim-lspconfig' },
    },
    setup = function()
      require 'navigator'.setup()
    end,
  },
  { 'lukas-reineke/cmp-under-comparator' },
}


-- Enable powershell as your default shell
vim.opt.shell = "pwsh.exe -NoLogo"
vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd [[
		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
  ]]

vim.opt.guifont = { "FiraCode Nerd Font", "h12" }

vim.cmd([[
  let g:neovide_remember_window_size = v:true
  let g:neovide_profiler = v:false

]])

-- Set a compatible clipboard manager
vim.g.clipboard = {
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
}

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
-- to disable icons and use a minimalist setup, uncomment the following

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
vim.keymap.set("i", "<C-r>", "<esc><C-r>i")
vim.keymap.set("i", "<C-q>", "<esc>:bd<cr>i")
vim.keymap.set("n", "<C-q>", ":bd<cr>")
vim.keymap.set("i", "<A-q>", "<esc>:bd!<cr>i")
vim.keymap.set("n", "<a-q>", ":bd!<cr>")
vim.keymap.set("i", "<C-w>", "<esc>:w<cr>i")
vim.keymap.set("i", "<C-s>", "<esc>:w<cr>i")
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("i", "<C-z>", "<esc>ui")
vim.keymap.set("i", "<C-v>", "<esc>l\"+Pi")
vim.keymap.set("v", "<C-c>", "<esc>\"+yyi")
vim.keymap.set("i", "<S-Up>", "<esc>k$vk")
vim.keymap.set("i", "<S-Down>", "<esc>j^vj")
vim.keymap.set("i", "<S-Left>", "<esc>vh")
vim.keymap.set("i", "<S-Right>", "<esc>vl")
vim.keymap.set("v", "<S-Up>", "k")
vim.keymap.set("v", "<S-Down>", "j")
vim.keymap.set("v", "<S-Left>", "b")
vim.keymap.set("v", "<S-Right>", "w")
-- add find and replace
local leftText = "<Left><Left><Left><Left><Left><Left><Left>"
vim.keymap.set("i", "<A-f>", "<esc>:%s/\\(\\)\\@<=txt/rep/gc" .. leftText)
vim.keymap.set("i", "<C-f>", "<esc>/")
-- vim.keymap.set("i", "<C-f>", "<esc>:Telescope fd<cr>")
vim.keymap.set("i", "<C-a>", '<esc>ggVG"+y<esc><C-o>a')
vim.keymap.set("v", "y", '"+ya')
vim.keymap.set("n", "<c-cr>", "O<esc>")
vim.keymap.set("n", "<cr>", "o<esc>")
vim.keymap.set("v", "i", "<esc>i")
vim.keymap.set("v", "a", "<esc>a")
vim.keymap.set("v", "I", "<esc>I")
vim.keymap.set("v", "A", "<esc>A")
vim.keymap.set("i", "<C-x>", "<esc>xi")
vim.keymap.set("i", "<A-s>", "<esc>:lua require'lightspeed'.sx:go({})<cr>")
-- vim.keymap.set("i", "<S-s>", "<esc>:lua require'lightspeed'.sx:go({ ['reverse?'] = true })<cr>")

-- vim fix me
-- vim.keymap.set("v", "<del>", 'di')

-- neovim autocmd save file

if vim.fn.exists(vim.g['started_by_firenvim']) then
  vim.api.nvim_exec([[ autocmd! FocusLost * ++nested write ]], false)
end

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["U"] = { ":UndotreeToggle<CR>", "UndoTree" }
lvim.builtin.which_key.mappings["h"] = {
  name = "harpoon",
  h = { "<cmd>:lua require(\"harpoon.ui\").toggle_quick_menu()<cr>", "Toggle quick menu" },
  j = { "<cmd>:lua require(\"harpoon.ui\").nav_next()<cr>", "Next menu" },
  k = { "<cmd>:lua require(\"harpoon.ui\").nav_prev()<cr>", "Prev menu" }
}

lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}


-- load extensions with telescope
lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "telescope")
  pcall(telescope.load_extension, "telescope-project")
  pcall(telescope.load_extension, "telescope-file-browser")
  pcall(telescope.load_extension, "telescope-fzy-native")
  pcall(telescope.load_extension, "refactoring")
  -- any other extensions loading
end


-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
-- lvim.builtin.terminal.shell = "pwsh.exe -NoLogo"

-- nvim-tree has some performance issues on windows, see kyazdani42/nvim-tree.lua#549
lvim.builtin.nvimtree.setup.diagnostics.enable = false
lvim.builtin.nvimtree.setup.git.enable = false
lvim.builtin.nvimtree.setup.update_cwd = false
lvim.builtin.nvimtree.setup.update_focused_file.update_cwd = false
lvim.builtin.nvimtree.setup.view.side = "float"

-- if you don't want all the parsers change this to a table of the ones you want
-- lvim.builtin.treesitter.ensure_installed = {
--   "typescript",
--   "javascript",
--   "tml",
--   "css",
--   "scss",
--   "nodejs",
--   "node",
--   "angular",
--   "lua",
-- }

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.highlight.enabled = true


-- conffigure extra cmp
local cmp = require("cmp")
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline {},
  sources = {
    { name = "cmdline" },
    { name = "path" },
  },
})
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})
require('cmp-npm').setup({})
cmp.setup({
  sources = {
    { name = 'npm', keyword_length = 4 },
  }
})
cmp.setup {
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      require "cmp-under-comparator".under,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
}

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact", "markdown", "md", "html", "lua" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {

  { command = "flake8", filetypes = { "python" } },
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "python" },
  },
  {
    command = "eslint_d",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "javascriptreact" },
  },
}

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}


require("telescope").load_extension "file_browser"

-- TODO: https://github.com/ray-x/navigator.lua
-- TODO: vedere se la whitch_key["T"] è già usata
-- TODO: refactoring
-- TODO: neogen
-- TODO: nvim spectre config
-- TODO: fix mappings chnage case (visual mode is not working yet)
-- TODO: wilder.nvim refactor remove cmp (verify if is different)
-- TODO:  vim sangex test if works


require("scrollbar").setup()
local Hydra = require('hydra')


Hydra({
  hint = [[
  ^^^^^^     Move     ^^^^^^   ^^     Split         ^^^^    Size
  ^^^^^^--------------^^^^^^   ^^---------------    ^^^^-------------
  ^ ^ _k_ ^ ^   ^ ^ _K_ ^ ^    _s_: horizontally    _+_ _-_: height
  _h_ ^ ^ _l_   _H_ ^ ^ _L_    _v_: vertically      _>_ _<_: width
  ^ ^ _j_ ^ ^   ^ ^ _J_ ^ ^    _q_: close           ^ _=_ ^: equalize
  focus^^^^^^   window^^^^^^
  ^ ^ ^ ^ ^ ^   ^ ^ ^ ^ ^ ^    _b_: choose buffer   ^ ^ ^ ^    _<Esc>_
 ]],
  config = {
    timeout = 4000,
    hint = {
      border = 'rounded'
    }
  },
  mode = 'n',
  body = '<C-w>',
  heads = {
    -- Move focus
    { 'h', '<C-w>h' },
    { 'j', '<C-w>j' },
    { 'k', '<C-w>k' },
    { 'l', '<C-w>l' },
    -- Move window
    { 'H', '<Cmd>WinShift left<CR>', { desc = 'move left' } },
    { 'J', '<Cmd>WinShift down<CR>', { desc = 'move down' } },
    { 'K', '<Cmd>WinShift up<CR>', { desc = 'move up' } },
    { 'L', '<Cmd>WinShift right<CR>', { desc = 'move right' } },
    -- Split
    { 's', '<C-w>s' },
    { 'v', '<C-w>v' },
    { 'q', '<Cmd>try | close | catch | endtry<CR>', { desc = 'close window' } },
    -- Size
    { '+', '<C-w>+' },
    { '-', '<C-w>-' },
    { '>', '2<C-w>>', { desc = 'increase width' } },
    { '<', '2<C-w><', { desc = 'decrease width' } },
    { '=', '<C-w>=', { desc = 'equalize' } },
    --
    { 'b', '<Cmd>BufExplorer<CR>', { exit = true, desc = 'choose buffer' } },
    { '<Esc>', nil, { exit = true } }
  }
})




lvim.builtin.which_key.mappings["C"] = { ":CheatSH<cr>", "CheatSH" }
lvim.builtin.which_key.mappings["T"] = {
  name = "+Text-case",
  u = { ":lua require('textcase').lsp_rename('to_upper_case')<CR>'<,'>", "Upper" },
  l = { ":lua require('textcase').lsp_rename('to_lower_case')<CR>'<,'>", "Lower" },
  s = { ":lua require('textcase').lsp_rename('to_snake_case')<CR>'<,'>", "snake" },
  d = { ":lua require('textcase').lsp_rename('to_dash_case')<CR>'<,'>", "dash" },
  n = { ":lua require('textcase').lsp_rename('to_constant_case')<CR>'<,'>", "constant" },
  o = { ":lua require('textcase').lsp_rename('to_dot_case')<cr>", "D-o.t" },
  h = { ":lua require('textcase').lsp_rename('to_phrase_case')<CR>\'<,\'>", "phrase" },
  c = { ":lua require('textcase').lsp_rename('to_camel_case')<CR>\'<,\'>", "camel" },
  p = { ":lua require('textcase').lsp_rename('to_pascal_case')<CR>\'<,\'>", "pascal" },
  t = { ":lua require('textcase').lsp_rename('to_title_case')<CR>'<,'>", "title" },
  f = { ":lua require('textcase').lsp_rename('to_path_case')<CR>\'<,\'>", "file_path" }
}


lvim.builtin.dap.active = true
lvim.builtin.notify.active = true

-- documentation code generator
require('neogen').setup({ snippet_engine = "luasnip" })
-- vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)


-- insert in cmp

-- -- load refactoring Telescope extension

-- remap to open the Telescope refactoring menu in visual mode
vim.api.nvim_set_keymap(
  "v",
  "<leader>r",
  "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
  { noremap = true }
)

require('nvim-treesitter.configs').setup {
  autotag = {
    enable = true,
  }
}

require('nvim-lightbulb').setup({ autocmd = { enabled = true } })
