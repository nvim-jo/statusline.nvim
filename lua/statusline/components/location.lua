-- Copyright (c) 2020-2021 hoob3rt
-- MIT license, see LICENSE for more details.
local function location()
  local line = vim.fn.line('.')
  local col = vim.fn.virtcol('.')
  return string.format('Ln %d, Col %d', line, col)
end

return location
