local qf = require('lspdiags.qflist')
local M = {}

function M.open()
    qf.populate_qflist()
    vim.cmd([[ copen ]])

    -- Disable line numbers
    vim.opt_local.nu = false
    vim.opt_local.rnu = false

    -- Enable wrapping
    qf.set_win_option('wrap', true)
end

function M.close()
    if qf.is_foreign_qf() then
        return
    end
    vim.cmd([[ cclose ]])
end

function M.update_list()
    qf.change_since_drawn = true

    if qf.is_foreign_qf() then
        return
    end

    qf.debounce_populate()
end

return M
