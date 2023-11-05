local Util = require('lazyvim.util')

local M = require('statusline.component'):extend()

local default_options = {
    color = Util.ui.fg("Special"),
    cwd = true,
    subdirectory = true,
    parent = true,
    other = true,
    enable_icon = true,
    dir_icon = "󱉭"
}

function M:get()
    local cwd = Util.root.cwd()
    local root = Util.root.get({ normalize = true })
    local name = vim.fs.basename(root)

    if root == cwd then
        -- root is cwd
        return self.options.cwd and name
    elseif root:find(cwd, 1, true) == 1 then
        -- root is subdirectory of cwd
        return self.options.subdirectory and name
    elseif cwd:find(root, 1, true) == 1 then
        -- root is parent directory of cwd
        return self.options.parent and name
    else
        -- root and cwd are not related
        return self.options.other and name
    end
end

function M:init(options)
    options = vim.tbl_deep_extend("keep", options or {}, default_options)
    options.cond = function ()
        return type(self:get()) == "string"
    end
    self.options = options
    M.super.init(self, options)
end

function M:update_status()
    return (self.options.enable_icon and self.options.dir_icon.." ")..self:get()
end

return M