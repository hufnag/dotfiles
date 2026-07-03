vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, {
                buffer = event.buf,
                desc = desc,
            })
        end

        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "gr", vim.lsp.buf.references, "Go to references")
        map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
        map("n", "K", vim.lsp.buf.hover, "Hover documentation")

        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")

        map("n", "<leader>sd", vim.diagnostic.open_float, "Show diagnostic")
        map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
        map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
    end,
})

vim.api.nvim_create_user_command("LspLog", function()
    vim.cmd.edit(vim.lsp.log.get_filename())
end, {
    desc = "Open Neovim LSP log",
})

vim.diagnostic.config({
    virtual_text = {
        spacing = 2,
        source = "if_many",
    },
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = true,
    underline = true,
})

local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
vim.env.PATH = mason_bin .. ":" .. vim.env.PATH

vim.lsp.enable({
    "clangd",
    "rust-analyzer",
    "lua_ls",
    "protols",
    "pyright",
    "rust_analyzer",
})

return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
    },

    {
        "mason-org/mason.nvim",
        cmd = "Mason",
        opts = {},
    },
}
