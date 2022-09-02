local M = {}

function M.tbllen(T)
    local count = 0
    for _ in pairs(T) do
        count = count + 1
    end
    return count
end

function M.diagnostics(buf)
    return vim.diagnostic.get(buf)
end

function M.get_qflist(opts)
    local diags = M.diagnostics(opts.buf)
    local qflist = vim.diagnostic.toqflist(diags)

    return qflist
end

function M.debounce(fn, ms)
    local timer = vim.loop.new_timer()
    return function(...)
        local argv = { ... }
        timer:start(ms, 0, function()
            timer:stop()
            vim.schedule_wrap(function()
                fn(unpack(argv))
            end)()
        end)
    end
end

return M
