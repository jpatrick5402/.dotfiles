-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
        { '\\', ':Neotree reveal float<CR>', desc = 'NeoTree reveal', silent = true },
    },
    opts = {
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
                hide_git_ignored = false,
            },
            hijack_netrw_behavior = 'open_current',
            bind_to_cwd = true, -- Ensure this is true for Neo-tree to follow the working directory
            window = {
                mappings = {
                    ['\\'] = 'close_window',
                },
            },
        },
    },
    lazy = false,
}
