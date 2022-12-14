local M = {}

local function do_log(msg, level)
    vim.notify('[lspdiags.nvim] ' .. msg, level, { title = 'lspdiags.nvim' })
end

function M.info(msg)
    do_log(msg, vim.log.levels.INFO)
end

function M.warn(msg)
    do_log(msg, vim.log.levels.WARN)
end

function M.error(msg)
    do_log(msg, vim.log.levels.ERROR)
end

return M
