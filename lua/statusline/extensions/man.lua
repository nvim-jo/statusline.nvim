local M = {}

M.sections = {
  statusline_a = {
    function()
      return 'MAN'
    end,
  },
  statusline_b = { { 'filename', file_status = false } },
  statusline_y = { 'progress' },
  statusline_z = { 'location' },
}

M.filetypes = { 'man' }

return M
