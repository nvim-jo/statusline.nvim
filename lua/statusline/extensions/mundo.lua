local M = {}

M.sections = {
  statusline_a = {
    function()
      local ft = vim.opt_local.filetype:get()
      return (ft == 'Mundo') and 'Change tree' or (ft == 'MundoDiff') and 'Change diff'
    end,
  },
  statusline_y = { 'progress' },
  statusline_z = { 'location' },
}

M.filetypes = {
  'Mundo',
  'MundoDiff',
}

return M
