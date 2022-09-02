local events = {}

function events.register()
    local cfg = require('lspdiags.internal.config').get()
    local utils = require('lspdiags.utils')
    local actions = require('lspdiags.actions')
    vim.api.nvim_create_autocmd(cfg.triggers, {
        pattern = { '*' },
        callback = function()
            actions.update_list()
            if cfg.auto_open and utils.tbllen(utils.diagnostics(nil)) > 1 then
                actions.open()
                vim.cmd([[ wincmd p ]]) -- Don't focus the list when opening
            end
            if cfg.auto_close and utils.tbllen(utils.diagnostics(nil)) == 0 then
                actions.close()
            end
        end,
    })
end

return events
