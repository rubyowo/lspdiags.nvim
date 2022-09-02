local utils = require('lspdiags.utils')

local M = {}

M.title = 'Project Diagnostics'
M.changed_since_drawn = false

function M.is_foreign_qf()
    return vim.fn.getqflist({ title = 0 }).title ~= M.title
end

function M.populate_qflist()
    if not M.change_since_drawn then
        return
    end

    local all_diags = utils.get_qflist({
        buf = nil,
    })

    vim.fn.setqflist(all_diags, 'r')
    vim.diagnostic.setqflist({ open = false, title = M.title })
    M.change_since_drawn = true
end

function M.set_win_option(name, val)
    vim.api.nvim_win_set_option(vim.fn.getqflist({ winid = 0 }).winid, name, val)
end

function M.init()
    local cfg = require('lspdiags.internal.config').get()
    M.debounce_populate = utils.debounce(function()
        M.populate_qflist()
    end, cfg.debounce)
end

return M
