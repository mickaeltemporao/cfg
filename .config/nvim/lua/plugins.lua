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
        -- use 'jamessan/vim-gnupg'
        -- use { 'michaelb/sniprun', run = 'bash ./install.sh'}
        -- use 'metakirby5/codi.vim'
        use {
          'jalvesaq/vimcmdline',
            config = function()
              vim.g.cmdline_app = { python = 'ipython', }
              -- vim.g.cmdline_app = {"python": "ipython --no-autoindent"}
              vim.g.cmdline_follow_colorscheme = 1
              vim.g.cmdline_map_send = 'E'
              vim.g.cmdline_map_send_and_stay = '<LocalLeader>e'
              vim.g.cmdline_map_start = '<LocalLeader>t'
              vim.g.cmdline_term_heigth = 36
            end
        }
        use 'mofiqul/dracula.nvim'
        use 'nvim-lualine/lualine.nvim'
        use 'vimwiki/vimwiki'
        use 'vincentcordobes/vim-translate'
    end
)

