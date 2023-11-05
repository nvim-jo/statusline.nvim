-- Copyright (c) 2020-2021 hoob3rt
-- MIT license, see LICENSE for more details.

local M = {}

M.sections = {
  statusline_a = {
    function()
      return 'OverseerList'
    end,
  },
}

M.filetypes = { 'OverseerList' }

return M
