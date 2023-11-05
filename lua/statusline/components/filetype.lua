-- Copyright (c) 2020-2021 hoob3rt
-- MIT license, see LICENSE for more details.
local statusline_require = require('statusline_require')
local modules = statusline_require.lazy_require {
  highlight = 'statusline.highlight',
  utils = 'statusline.utils.utils',
}
local M = statusline_require.require('statusline.component'):extend()

local default_options = {
  colored = true,
  icon_only = false,
  capitalize = true,
}

local function capitalizeFirstLetter(str)
  -- Check if the string is not empty
  if #str > 0 then
      -- Capitalize the first letter and make the rest lowercase
      return str:sub(1, 1):upper() .. str:sub(2):lower()
  else
      return str
  end
end

function M:init(options)
  M.super.init(self, options)
  self.options = vim.tbl_deep_extend('keep', self.options or {}, default_options)
  if self.options.capitalize then
    self.options.fmt = capitalizeFirstLetter
  end 
  self.icon_hl_cache = {}
end

function M.update_status()
  local ft = vim.bo.filetype or ''
  return modules.utils.stl_escape(ft)
end

function M:apply_icon()
  if not self.options.icons_enabled then
    return
  end

  local icon, icon_highlight_group
  local ok, devicons = pcall(require, 'nvim-web-devicons')
  if ok then
    icon, icon_highlight_group = devicons.get_icon(vim.fn.expand('%:t'))
    if icon == nil then
      icon, icon_highlight_group = devicons.get_icon_by_filetype(vim.bo.filetype)
    end

    if icon == nil and icon_highlight_group == nil then
      icon = ''
      icon_highlight_group = 'DevIconDefault'
    end
    if self.options.colored then
      local highlight_color = modules.utils.extract_highlight_colors(icon_highlight_group, 'fg')
      if highlight_color then
        local default_highlight = self:get_default_hl()
        local icon_highlight = self.icon_hl_cache[highlight_color]
        if not icon_highlight or not modules.highlight.highlight_exists(icon_highlight.name .. '_normal') then
          icon_highlight = self:create_hl({ fg = highlight_color }, icon_highlight_group)
          self.icon_hl_cache[highlight_color] = icon_highlight
        end

        icon = self:format_hl(icon_highlight) .. icon .. default_highlight
      end
    end
  else
    ok = vim.fn.exists('*WebDevIconsGetFileTypeSymbol')
    if ok ~= 0 then
      icon = vim.fn.WebDevIconsGetFileTypeSymbol()
    end
  end

  if not icon then
    return
  end

  if self.options.icon_only then
    self.status = icon
  elseif type(self.options.icon) == 'table' and self.options.icon.align == 'right' then
    self.status = self.status .. ' ' .. icon
  else
    self.status = icon .. ' ' .. self.status
  end
end

return M
