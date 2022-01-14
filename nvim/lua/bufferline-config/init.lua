require("bufferline").setup()

vim.cmd([[
nnoremap <C-]> :BufferLineCycleNext<CR>
nnoremap <C-[> :BufferLineCyclePrev<CR>
unmap <ESC>
]])
