-- Copyright (c) 2020-2021 shadmansaleh
-- MIT license, see LICENSE for more details.
local M = require('statusline.component'):extend()
local modules = require('statusline_require').lazy_require {
  git_branch = 'statusline.components.branch.git_branch',
  highlight = 'statusline.highlight',
  utils = 'statusline.utils.utils',
}

-- Initializer
M.init = function(self, options)
  options.icon = options.icon or { "", color = { fg = "#a6e3a1"} }
  M:create_option_highlights()
  M.super.init(self, options)
  modules.git_branch.init()
end

M.update_status = function(_, is_focused)
  local buf = (not is_focused and vim.api.nvim_get_current_buf())
  local branch = modules.git_branch.get_branch(buf)
  return modules.utils.stl_escape(branch)
end

return M
