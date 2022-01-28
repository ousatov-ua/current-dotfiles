require("bufferline").setup()

vim.cmd([[
nnoremap <C-l> :BufferLineCycleNext<CR>
nnoremap <C-h> :BufferLineCyclePrev<CR>
]])
