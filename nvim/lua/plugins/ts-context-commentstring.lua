return { -- Correct comment syntax inside JSX ({/* */} in markup, // in code)
    'JoosepAlviste/nvim-ts-context-commentstring',
    event = { 'BufReadPre', 'BufNewFile' },
    init = function()
        -- Neovim 0.10+ built-in commenting (gc) picks up the treesitter-aware
        -- commentstring through this integration.
        vim.g.skip_ts_context_commentstring_module = true
    end,
    opts = {
        enable_autocmd = false,
    },
}
