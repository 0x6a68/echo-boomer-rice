if vim.loop.fs_stat(".nvim.lua") then
  vim.opt.exrc = true -- allow local .nvim.lua .vimrc .exrc files
  return
end

require("config.lazy")()
