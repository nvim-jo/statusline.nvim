local M = require("statusline.component"):extend()
local Util = require('lazyvim.util')

local default_options = {
    cond = function ()
        local Checker = require("lazy.manage.checker")
        return #Checker.updated > 0
    end,
    color = Util.ui.fg('Special') 
}

function M:init(options)
    options = vim.tbl_deep_extend("keep", options or {}, default_options)
    self.options = options
    M.super.init(self, options)
end

function M:update_status()
    local Config = require("lazy.core.config")
    local Checker = require("lazy.manage.checker")
    local updates = #Checker.updated
    return updates > 0 and (Config.options.ui.icons.plugin .. "" .. updates)
end

return M