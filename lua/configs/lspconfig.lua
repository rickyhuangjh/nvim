-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"


-- EXAMPLE

-- lsps with default config
lspconfig.gopls.setup({
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    vim.diagnostic.config({
        virtual_text = false,
    }),
    filetypes = { "go", "gomod" }
})

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = "rounded",
            source = "always",
            scope = "line",
            max_width = math.min(80, math.floor(vim.api.nvim_win_get_width(0) * 0.8)),
        })
    end
})

    -- configuring single server, example: typescript
    -- lspconfig.ts_ls.setup {
    --   on_attach = nvlsp.on_attach,
    --   on_init = nvlsp.on_init,
    --   capabilities = nvlsp.capabilities,
    -- }
