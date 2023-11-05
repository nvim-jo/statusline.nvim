-- Copyright (c) 2020-2021 shadmansaleh
-- MIT license, see LICENSE for more details.
-- Credit: itchyny(lightline)
local background = vim.opt.background:get()

return require('statusline.themes.papercolor_' .. background)
