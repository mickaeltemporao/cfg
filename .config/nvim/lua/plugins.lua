-- Automatically run :PackerCompile whenever plugins.lua is updated 
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Automatically install and set up packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Plugins specification
require 'packer'.startup(
    function(use)
        use 'lewis6991/impatient.nvim'
        use 'wbthomason/packer.nvim' -- Package manager
        use 'nvim-lualine/lualine.nvim'
        use 'mofiqul/dracula.nvim'
        use 'vincentcordobes/vim-translate'
    end
)

