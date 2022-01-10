local opt = vim.opt -- to set options
opt.backspace = { "indent", "eol", "start" }
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.cursorline = true
opt.cursorcolumn = false
opt.encoding = "utf-8" -- Set default encoding to UTF-8
opt.expandtab = true -- Use spaces instead of tabs
opt.foldenable = false
opt.foldmethod = "indent"
opt.formatoptions = "l"
opt.hidden = true -- Enable background buffers
opt.hlsearch = true -- Highlight found searches
opt.ignorecase = true -- Ignore case
opt.inccommand = "split" -- Get a preview of replacements
opt.incsearch = true -- Shows the match while typing
opt.joinspaces = false -- No double spaces with join
vim.o.lazyredraw = true
opt.linebreak = true -- Stop words being broken on wrap
opt.number = true -- Show line numbers
opt.list = true -- Show some invisible characters
opt.listchars = { tab = " ", trail = "·" }
opt.relativenumber = true
opt.scrolloff = 4 -- Lines of context
opt.shiftround = true -- Round indent
opt.shiftwidth = 4 -- Size of an indent
opt.showmode = false -- Don't display mode
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes:1" -- always show signcolumns
opt.smartcase = true -- Do not ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en_gb" }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 4 -- Number of spaces tabs count for
opt.termguicolors = true -- You will have bad experience for diagnostic messages when it's default 4000.
vim.o.whichwrap = vim.o.whichwrap .. "<,>" -- Wrap movement between lines in edit mode with arrows
opt.wrap = true
-- opt.cc = "80"
opt.mouse = "a"
opt.guicursor =
  "n-v-c-sm:block-blinkwait50-blinkon50-blinkoff50,i-ci-ve:ver25-Cursor-blinkon100-blinkoff100,r-cr-o:hor20"
opt.undodir = vim.fn.stdpath("config") .. "/undo"
opt.undofile = true
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = true}") -- disabled in visual mode
-- Give me some fenced codeblock goodness
--vim.g.markdown_fenced_languages = { "html", "javascript", "typescript", "css", "scss", "lua", "vim" }
vim.g.mapleader = ","

vim.cmd([[
"Copy-paste settings

set clipboard=unnamedplus
xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'
xnoremap y "*y
xnoremap d "*d
nnoremap x "_d

set laststatus=2
set colorcolumn=121

"Telescope
nnoremap <space>ff <cmd>Telescope find_files<cr>
nnoremap <space>fg <cmd>Telescope live_grep<cr>
nnoremap <space>fb <cmd>Telescope buffers<cr>
nnoremap <space>fh <cmd>Telescope help_tags<cr>

"Nvim Tree
nnoremap <space>ee :NvimTreeFocus<CR>
nnoremap <space>ec :NvimTreeClose<CR>
nnoremap <space>er :NvimTreeFindFile<CR>

"Close Buffer
nnoremap <space>bc :bp\|bd #<CR>
command! Bonly silent execute "%bd!|norm <C-O>"
nnoremap <space>bo :Bonly<CR>

" BufferLine
nnoremap <C-]> :BufferLineCycleNext<CR>
nnoremap <C-[> :BufferLineCyclePrev<CR>

"let s:schema = "everforest"
let s:schema = "not_selected"

if s:schema == "PaperColor"
    set background=light
    let g:PaperColor_Theme_Options = {
        \   'theme': {
        \     'default': {
        \          'transparent_background': 1
        \     }
        \   }
        \ }

    colorscheme PaperColor
    hi String cterm=bold gui=bold ctermfg=15 guifg=#106b10
    hi Character cterm=bold gui=bold ctermfg=15 guifg=#106b10
    hi Conditional guifg=#071591 gui=bold cterm=bold
    hi Repeat guifg=#071591 gui=bold cterm=bold
    hi Todo guifg=#071591
    hi Number guifg=#1740e
    hi Todo guifg=#071591 gui=bold cterm=bold
    hi Statement guifg=#071591 gui=bold cterm=bold
    hi Special guifg=#071591 gui=bold cterm=bold
    hi Operator guifg=#071591 gui=bold cterm=bold
    hi Type guifg=#071591 gui=bold cterm=bold
    hi Function guifg=#071591 gui=bold cterm=bold
    hi Identifier guifg=#071591 gui=bold cterm=bold
    hi Typedef guifg=#071591 gui=bold cterm=bold
    hi Include guifg=#071591 gui=bold
    hi Exception guifg=#071591 gui=bold cterm=bold
    hi Keyword guifg=#071591
    hi Boolean guifg=#071591 gui=bold cterm=bold
    hi Define guifg=#071591 gui=bold
elseif s:schema == "dayFox"
    colorscheme dayfox
elseif s:schema == "nightfox"
    colorscheme nightfox
elseif s:schema == "nordfox"
    colorscheme nordfox
elseif s:schema == "dawnfox"
    colorscheme dawnfox
elseif s:schema == 'everforest'
    set background=light
    let g:everforest_background = 'medium'
    let g:everforest_enable_italic = 1
    let g:everforest_disable_italic_comment = 0
    let g:everforest_ui_contrast = 'high'
    let g:everforest_diagnostic_text_highlight = 1
    colorscheme everforest
elseif s:schema == 'edge'
    set background=light
    let g:edge_style = 'neon'
    let g:edge_enable_italic = 1
    let g:edge_disable_italic_comment = 0
    let g:edge_diagnostic_text_highlight = 1
    colorscheme edge
elseif s:schema == 'tokyonight'
    colorscheme tokyonight
elseif s:schema == 'darkula'
    colorscheme darcula
elseif s:schema == 'melange'
    set background=light
    colorscheme melange
endif

" Config nvim-cmp
set completeopt=menu,menuone,noselect
]])

-- Github theme
--[[
require("github-theme").setup({
    theme_style = "light",
  function_style = "italic",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},
 })
 ]]

-- Nightfox color schema
-- require('nightfox').load('dawnfox')

-- Rose-pine color schema
-- require('rose-pine').set('moon')
--
-- OneNord scheme

require('onenord').setup({
  theme = 'light', -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
  borders = true, -- Split window borders
  fade_nc = false, -- Fade non-current windows, making them more distinguishable
  styles = {
    diagnostics = "underline", -- Style that is applied to diagnostics: see `highlight-args` for options
  },
  disable = {
    background = false, -- Disable setting the background color
    cursorline = false, -- Disable the cursorline
    eob_lines = true, -- Hide the end-of-buffer lines
  },
  custom_highlights = {}, -- Overwrite default highlight groups
  custom_colors = {
    --bg = "#F7F8FA",
    bg = "#FFFFF8",
    --[[fg = "#2E3440",
    fg_light = "#4C566A",
    gray = "#838FA6",
    light_gray = "#646A76",
    cyan = "#3EA1AD",
    blue = "#3879C5",
    dark_blue = "#1B40A6",
    green = "#48A53D",
    light_green = "#5F9E9D",
    dark_red = "#C53B40",
    red = "#CB4F53",
    light_red = "#D16366",
    pink = "#E85B7A",
    dark_pink = "#E44675",
    orange = "#EE5E25",
    yellow = "#BA793E",
    purple = "#9F4ACA",
    light_purple = "#9665AF",
    none = "NONE"
    ]]
  }, -- Overwrite default colors
})

-- Setup NvimTree
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local list = {
  { key = {"<CR>", "l", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
  { key = "y",                            cb = tree_cb("copy") },
  { key = "c",                            cb = tree_cb("copy_name") },
}
require'nvim-tree'.setup {
  view = {
    width = 50,
    side = "left",
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = list
    }
  }
}
local actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    }
  }
}

-- Vgit
require('vgit').setup()

require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require('lualine').setup{
    options = {
        theme = "onenord"
        --theme = "everforest"
   }
}

-- buffers line
require("bufferline").setup{}


-- Nvim-cmp
-- Setup nvim-cmp.
  local cmp = require'cmp'
  

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<C-j>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i', 's', }),
      ['<C-k>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { 'i', 's', }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  -- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --  capabilities = capabilities
  -- }

-- Colorizer
--
require 'colorizer'.setup {
  'css';
  'javascript';
  'lua';
  html = {
    mode = 'foreground';
  }
}

vim.cmd([[
unmap <ESC>
]])
