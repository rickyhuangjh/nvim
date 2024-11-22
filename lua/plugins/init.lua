return {


    {
        "stevearc/conform.nvim",
        event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },


    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = "all",
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            }
        },
    },

    {
        "Pocco81/auto-save.nvim",
        lazy = false,
        opts = {
            condition = function(buf)
                local filepath = vim.api.nvim_buf_get_name(buf)
                -- Disable autosave for any file under the ~/.config/nvim directory
                if filepath:match(vim.fn.expand("~/.config/nvim")) then
                    vim.notify(
                        "AutoSave is disabled for files in the nvim directory",
                        vim.log.levels.INFO
                    )
                    return false
                end
                return true  -- Enable autosave for all other files
            end,
            execution_message = {cleaning_interval = 4000}
        }
    },

    {
        "lervag/vimtex",
        ft = "tex",
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_general_viwer = "open"
            vim.g.vimtex_compiler_method = "latexmk"

            -- Open quickfix on the right side instead of below

        end
    },

}


