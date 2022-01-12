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

vim.cmd([[
nnoremap <space>ee :NvimTreeFocus<CR>
nnoremap <space>ec :NvimTreeClose<CR>
nnoremap <space>er :NvimTreeFindFile<CR>
]])
