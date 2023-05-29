require('refactoring').setup({
	 prompt_func_return_type = {
        go = true,
        c = true,
        h = true,
        hpp = true,
        cxx = true,
    },
    prompt_func_param_type = {
        go = true,
        cpp = true,
        c = true,
        h = true,
        hpp = true,
        cxx = true,
    },
    printf_statements = {},
    print_var_statements = {},
							})

vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
