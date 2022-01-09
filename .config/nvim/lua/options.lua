local opt = vim.opt -- to set options
opt.backspace = { "indent", "eol", "start" }
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.cursorline = true
opt.cursorcolumn = true
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
-- vim.g.markdown_fenced_languages = { "html", "javascript", "typescript", "css", "scss", "lua", "vim" }
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
]])

-- Setup NvimTree
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local list = {
  { key = {"<CR>", "l", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") }
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

require('lualine').setup()

-- buffers line
require("bufferline").setup{}


vim.cmd([[
unmap <ESC>
]])