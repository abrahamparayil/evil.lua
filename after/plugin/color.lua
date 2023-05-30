-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox").setup({
    italic = {
        strings = false,
    },
    contrast = "hard", -- can be "hard", "soft" or empty string
    transparent_mode = true,
})

vim.cmd("colorscheme gruvbox")
