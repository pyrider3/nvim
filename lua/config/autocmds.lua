-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Chinese Markdown prose should not be checked against an English dictionary.
vim.api.nvim_create_autocmd({ "FileType", "BufWinEnter" }, {
  group = vim.api.nvim_create_augroup("NeonMarkdownSpell", { clear = true }),
  callback = function()
    if vim.bo.filetype == "markdown" then
      vim.opt_local.spell = false
    end
  end,
})
-- Also apply when this config loads after the initial FileType event.
for _, win in ipairs(vim.api.nvim_list_wins()) do
  if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "markdown" then
    vim.wo[win].spell = false
  end
end

-- Replace the default yank flash with the cockpit accent.
pcall(vim.api.nvim_del_augroup_by_name, "lazyvim_highlight_yank")
local neon = vim.api.nvim_create_augroup("NeonFeedback", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = neon,
  callback = function() vim.hl.on_yank({ higroup = "NeonYank", timeout = 160 }) end,
})
vim.api.nvim_create_autocmd("BufReadPost", {
  group = neon,
  callback = function(ev)
    vim.defer_fn(function()
      if vim.api.nvim_get_current_buf() ~= ev.buf or vim.bo[ev.buf].buftype ~= "" then return end
      local ns = vim.api.nvim_create_namespace("NeonLanding")
      local row = vim.api.nvim_win_get_cursor(0)[1] - 1
      local mark = vim.api.nvim_buf_set_extmark(ev.buf, ns, row, 0,
        { line_hl_group = "NeonLanding", priority = 110 })
      vim.defer_fn(function()
        if vim.api.nvim_buf_is_valid(ev.buf) then vim.api.nvim_buf_del_extmark(ev.buf, ns, mark) end
      end, 180)
    end, 30)
  end,
})
