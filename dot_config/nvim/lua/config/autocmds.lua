vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.sh.tmpl",
  callback = function()
    vim.bo.filetype = "sh"
  end,
})

-- Create parent directories automatically
vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Create parent directories on save",
  callback = function(event)
    local file = event.match

    -- Ignore special buffers / URLs
    if file:match("^%w%w+://") then
      return
    end

    local dir = vim.fn.fnamemodify(file, ":p:h")

    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})
