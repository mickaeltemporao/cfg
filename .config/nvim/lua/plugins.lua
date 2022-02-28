return require('packer').startup(
    function(use)
        use 'lewis6991/impatient.nvim'
        use 'wbthomason/packer.nvim'
        use 'dpelle/vim-Grammalecte'
        use 'ctrlpvim/ctrlp.vim'
        use 'honza/vim-snippets'
        use 'itchyny/lightline.vim'
        use {
            'jalvesaq/Nvim-R',
             branch = 'stable',
        }
        use 'jalvesaq/vimcmdline'
        use 'jamessan/vim-gnupg'
        use 'junegunn/goyo.vim'
        use 'junegunn/vim-easy-align'
        use 'mofiqul/dracula.nvim'
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
        }
        use 'sirver/ultisnips'
        use 'tpope/vim-commentary'
        use 'tpope/vim-fugitive'
        use 'tpope/vim-surround'
        use 'vim-pandoc/vim-pandoc'
        use 'vim-pandoc/vim-pandoc-syntax'
        use 'vim-pandoc/vim-rmarkdown'
        use 'vimwiki/vimwiki'
        use 'vincentcordobes/vim-translate'
    end
)
