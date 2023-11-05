-- Copyright (c) 2020-2021 hoob3rt
-- MIT license, see LICENSE for more details.
local modules = require('statusline_require').lazy_require {
  utils = 'statusline.utils.utils',
}

local function hostname()
  return modules.utils.stl_escape(vim.loop.os_gethostname())
end

return hostname
