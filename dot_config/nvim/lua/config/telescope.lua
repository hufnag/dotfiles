local builtin = require('telescope.builtin')
local file_browser = require('telescope').extensions.file_browser
vim.keymap.set('n', '<Space>i', function()
    builtin.find_files({
        no_ignore = true,
        prompt_title = 'All Files',
        hidden = true
    })
end, {})
vim.keymap.set('n', '<Space>f', builtin.find_files, {})
-- vim.keymap.set('n', '<Space>h', builtin.find_files, { hidden = true })
vim.keymap.set('n', '<Space>fh', ":Telescope find_files hidden=true<CR>", {})
vim.keymap.set('n', '<Space>fi', ":Telescope find_files no_ignore=true<CR>", {})
vim.keymap.set('n', '<Space>p', ":Telescope find_files cwd=", {})
vim.keymap.set('n', '<Space>o', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>gf', builtin.live_grep, {})
vim.keymap.set('n', '<Space>gs', builtin.grep_string, {})
vim.keymap.set('n', '<Space>b', builtin.buffers, {})
vim.keymap.set('n', '<Space>?', builtin.help_tags, {})
vim.keymap.set('n', '<Space>c', builtin.commands, {})
vim.keymap.set('n', '<Space>ch', builtin.command_history, {})
vim.keymap.set('n', '<Space>q', builtin.quickfix, {})
vim.keymap.set('n', '<Space>k', builtin.keymaps, {})
vim.keymap.set('n', '<Space>s', builtin.spell_suggest, {})
vim.keymap.set('n', '<Space>tt', file_browser.file_browser, {})
vim.keymap.set('n', '<Space>tb', ":Telescope file_browser path=%:p:h select_buffer=true hidden=true<CR>", {})
vim.keymap.set('n', '<Space>th', ":Telescope file_browser path=~ hidden=true<CR>", {})

vim.keymap.set('n', '<leader>r', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>d', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>i', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>e', builtin.diagnostics, {})
vim.keymap.set('n', '<Space>d', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<Space>w', builtin.lsp_workspace_symbols, {})
vim.keymap.set('n', '<Space>m', builtin.man_pages, {})

require("telescope").load_extension("file_browser")
require('telescope').load_extension('media_files')

require 'telescope'.setup {
    extensions = {
        file_browser = {
            -- theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                    -- remap to going to home directory
                    -- ["<C-h>"] = file_browser.actions.goto_home_dir
                },
                ["n"] = {
                    -- your custom normal mode mappings
                },
            },
        },
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { "png", "webp", "jpg", "jpeg" },
            -- find command (defaults to `fd`)
            find_cmd = "rg"
        }
    },
}

-- require('telescope').load_extension('dap')
