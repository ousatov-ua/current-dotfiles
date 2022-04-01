require("bufferline").setup{
    options = {
        separator_style = "thick",
        show_tab_indicators = true
    }
}

vim.cmd([[
nnoremap ¬ :BufferLineCycleNext<CR>
nnoremap ˙ :BufferLineCyclePrev<CR>
nnoremap <space>gb :BufferLinePick<CR>
]])

