"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugins')

" Plug 'dpelle/vim-Grammalecte'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'jalvesaq/vimcmdline'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mofiqul/dracula.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sirver/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vimwiki/vimwiki'

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set System Clipboard by default
set clipboard=unnamedplus

" Persistent undo
set undofile
set undodir=~/.config/nvim/undo

" Read .pdf, .doc, .odt, .rtf in vim!
autocmd BufReadPost *.doc,*.docx,*.rtf,*.odp,*.odt silent %!pandoc "%" -tplain -o /dev/stdout

" Delete Trailing Whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Color Scheme
colorscheme dracula

" Ignore Case
set ic

" Show line numbers
set number

" Highlight Over Length Lines
set cc=80

" No-Wrapping Lines
set nowrap

" Allow to Navigate Between Buffers Without Saving
set hidden

" Use spaces instead of tabs
set expandtab

" Replace tab with 4 spaces
set shiftwidth=4
set tabstop=4

" Map leader to space bar
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" netrw
let g:netrw_liststyle = 3
let g:netrw_altv = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language Environnments Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '~/.pyenv/versions/3.10.1/bin/python3'

" r
" Set R Tabulation Behaviour
" autocmd FileType r setlocal shiftwidth=2 tabstop=2
" Set file type for RMarkdown files
" autocmd BufNewFile,BufRead *.Rmd set filetype=rmarkdown




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Toggle Spelling On/Off & Switch
function! ToggleSpellLang()
    " toggle between en and fr
    if &spelllang =~# 'en'
        :set spelllang=fr
    else
        :set spelllang=en
    endif
endfunction
nnoremap <F7> :setlocal spell!<CR> " toggle spell on or off
nnoremap <F8> :call ToggleSpellLang()<CR> " toggle language

" vifm pdf scrolling
" map > :!vifmimg inc<CR>
" map < :!vifmimg dec<CR>

" grammalecte
let g:grammalecte_cli_py='/usr/bin/grammalecte-cli'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightligne
set noshowmode
let g:lightline = {'colorscheme': 'darcula'}

" vim-fugitive
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" vimwiki
let g:vimwiki_list = [ {'path': '~/Documents/notes', 'syntax': 'markdown', 'ext': '.md'}]

" vim-gnupg
let g:GPGFilePattern = '*.\(gpg\|asc\|pgp\)\(.md\)\='
let g:GPGPreferArmor = 1
let g:GPGDefaultRecipients = ["mickael.temporao@gmail.com"]

" vimcmdline
let g:cmdline_app              = {"python": "ipython --no-autoindent"}
let cmdline_map_start          = '<LocalLeader>t'
let cmdline_map_send           = '<c-Space>'
let cmdline_vsplit             = 0
let cmdline_term_width         = 80
let cmdline_term_heigth        = 24
let cmdline_in_buffer          = 1
let cmdline_follow_colorscheme = 1

" Nvim-R
vmap <C-Space> <Plug>RDSendSelection
nmap <C-Space> <Plug>RDSendLine
" Disable underscore shortcut in Nvim-R
let R_assign = 0

" ctrlP
" Open buffer menu
nnoremap <Leader>f :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>o :CtrlPMRUFiles<CR>
" Ignore files
let g:ctrlp_user_command = ['.git']
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard']

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
