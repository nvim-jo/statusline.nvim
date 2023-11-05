local M = require('statusline.component'):extend()

local default_opts = {
    color = function()
        -- auto change color according to neovims mode
        local get_mode = require('statusline.utils.mode').get_color_mode()
        return { fg = get_mode }
    end,
}

function M:init(options)
    options = vim.tbl_deep_extend("keep", options or {}, default_opts) 
    M.super.init(self, options)
end

function M:update_status()
    return '▊' 
end

return M