local lspdiags = {}
local config = require('lspdiags.internal.config')
local events = require('lspdiags.internal.events')
local log = require('lspdiags.internal.log')
local qflist = require('lspdiags.qflist')

function lspdiags.setup(opts)
    if config.is_set() then
        return log.error('setup() was called more than once')
    end

    config.apply(opts)

    events.register()

    qflist.init()
end

return lspdiags
