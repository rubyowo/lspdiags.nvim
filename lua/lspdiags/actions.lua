local qf = require('lspdiags.qflist')
local M = {}

function M.open()
    qf.debounce_populate()
    vim.cmd([[ copen ]])
    M.isopen = true

    -- Disable line numbers
    vim.opt_local.nu = false
    vim.opt_local.rnu = false
end

function M.close()
    if qf.is_foreign_qf() then
        return
    end
    vim.cmd([[ cclose ]])
    M.isopen = false
end

function M.update_list()
    qf.change_since_drawn = true

    if qf.is_foreign_qf() then
        return
    end

    qf.debounce_populate()
end

function M.toggle()
    if M.isopen then
        M.close()
    else
        M.open()
    end
end

return M
