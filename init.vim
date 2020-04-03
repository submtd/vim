" auto install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin('~/.config/nvim/plugged')
    " sensible defaults
    Plug 'tpope/vim-sensible'
    " material theme
    Plug 'kaicataldo/material.vim'
call plug#end()

" theme settings
if (has('termguicolors'))
  set termguicolors
endif
let g:material_theme_style = 'default'
let g:material_theme_italics = 1
colorscheme material

" general settings
" tabs are always 4 spaces
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
" enable mouse
set mouse=a
" don't make backup files
set nobackup nowritebackup
" always show the sign column
set signcolumn=yes
" line numbering
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END
" show column markers at 81 and 121 columns
set colorcolumn=81,121

