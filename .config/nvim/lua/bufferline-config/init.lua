require("bufferline").setup{
    options = {
        separator_style = "thick",
        show_tab_indicators = true
    }
}

vim.cmd([[
nnoremap <C-l> :BufferLineCycleNext<CR>
nnoremap <C-h> :BufferLineCyclePrev<CR>
nnoremap <space>gb :BufferLinePick<CR>
]])
