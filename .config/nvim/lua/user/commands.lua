vim.cmd([[
  command! -bang -nargs=0 RgDiffMaster call fzf#vim#grep("git diff main... | git-diff-2-vim", 0, {}, <bang>0)
]])
