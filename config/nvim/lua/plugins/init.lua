local git_repo = 'git@github.com:folke/lazy.nvim.git'
local install_path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(install_path) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    git_repo,
    install_path,
  })
end

vim.opt.rtp:prepend(install_path)

require('lazy').setup('plugins.list')
