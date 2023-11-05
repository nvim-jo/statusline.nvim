local M = {}

M.sections = {
  statusline_a = {
    function()
      return vim.fn['ctrlspace#context#Configuration']().Symbols.CS
    end,
  },
  statusline_b = { 'ctrlspace#api#StatuslineModeSegment' },
  statusline_y = { 'ctrlspace#api#StatuslineTabSegment' },
  statusline_z = {
    function()
      return 'CtrlSpace'
    end,
  },
}

M.filetypes = { 'ctrlspace' }

return M
