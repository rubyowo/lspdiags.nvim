local tbl = require('plenary.tbl')
local log = require('lspdiags.internal.log')

local DEFAULTS = {
    debounce = {
        enabled = true,
        delay = 150,
    },
    triggers = {
        'WinEnter',
        'BufEnter',
        'DiagnosticChanged',
    },
    auto_open = false,
    auto_close = false,
}

local config = {}
config.defaults = DEFAULTS

function config.is_set()
    return config.data ~= nil
end

function config.get()
    if not config.is_set() then
        log.error('config is not set')
    end
    return config.data
end

function config.apply(opts)
    assert(opts ~= nil, 'opts were not provided')
    config.data = vim.deepcopy(opts)
    config.data = tbl.apply_defaults(config.data, DEFAULTS)
    return config.get()
end

return config
