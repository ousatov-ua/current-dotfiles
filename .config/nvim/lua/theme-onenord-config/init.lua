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

  styles = {
    comments = "NONE", -- Style that is applied to comments: see `highlight-args` for options
    strings = "NONE", -- Style that is applied to strings: see `highlight-args` for options
    keywords = "bold", -- Style that is applied to keywords: see `highlight-args` for options
    functions = "NONE", -- Style that is applied to functions: see `highlight-args` for options
    variables = "NONE", -- Style that is applied to variables: see `highlight-args` for options
    diagnostics = "underline", -- Style that is applied to diagnostics: see `highlight-args` for options
  },


-- Overwrite default colors
  custom_colors = {
    bg = "#FFFFF8",
    light_gray = "#808080",
    cyan = "#15878B"
    --[[
    bg = "#F7F8FA",
    fg = "#2E3440",
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

local colors = require("onenord.colors").load()

require('onenord').setup({

  -- Overwrite default highlight groups
  custom_highlights = {
        TSConstructor = { fg = colors.cyan },
        TSType = { fg = colors.cyan },
        TSOperator = {fg = colors.fg},
        TSKeyword = {fg = colors.dark_blue},
        TSKeywordReturn = {fg = colors.dark_blue},
        TSVariable = {fg = colors.fg},
        TSAttribute = {fg = colors.yellow},
        TSTypeBuiltin = {fg = colors.dark_blue},
        TSVariableBuiltin = {fg = colors.dark_blue},
        TSParameter = {fg = colors.purple},
        TSMethod = {fg = colors.fg},
  },
})
