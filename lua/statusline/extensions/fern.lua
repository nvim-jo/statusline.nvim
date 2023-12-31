-- MIT license, see LICENSE for more details.
-- Extension for fern file explorer.
local nerdtree = require('statusline.extensions.nerdtree')

local M = {}

M.sections = vim.deepcopy(nerdtree.sections)

M.filetypes = { 'fern' }

return M
