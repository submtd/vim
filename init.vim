" vim-plug auto install
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" install plugins
call plug#begin()

    " NERDTree
    Plug 'scrooloose/nerdtree'

    " git integration
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " linting
    Plug 'w0rp/ale'

    " PHP specific integration
    Plug 'phpactor/phpactor', {'do': 'composer install', 'for': 'php'}
    Plug 'Shougo/deoplete.nvim'
    Plug 'kristijanhusak/deoplete-phpactor'

    " Debugger
    Plug 'vim-vdebug/vdebug'
    
    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " Comments
    Plug 'tpope/vim-commentary'

    " Search
    Plug 'junegunn/fzf', {'do': { -> fzf#install() } }

    " Syntax
    Plug 'sheerun/vim-polyglot'
    Plug 'matthewbdaly/vim-filetype-settings'

    " Themes
    Plug 'kaicataldo/material.vim'
    Plug 'itchyny/lightline.vim'

    " Editorconfig
    Plug 'editorconfig/editorconfig-vim'

call plug#end()

"Completion with Deoplete
let g:deoplete#enable_at_startup = 1
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" general settings
syntax on
set nu
filetype plugin indent on
set nocp
set ruler
set wildmenu
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set mouse=a

" theme settings
set t_Co=256
if (has('termguicolors'))
  set termguicolors
endif
let g:material_terminal_italics = 1
let g:material_theme_style = 'default'
let g:lightline = { 'colorscheme': 'material_vim' }
colorscheme material
set noshowmode

" code folding
set foldmethod=manual

"Tabs and spacing
set autoindent
set cindent
set tabstop=4
set expandtab
set shiftwidth=4
set smarttab

"Search
set hlsearch
set incsearch
set ignorecase
set smartcase
set diffopt +=iwhite

"Use FZF for search
nnoremap <C-p> :FZF<Cr>
let g:fzf_tags_command = 'ctags'

"Open quickfix window after running git grep
autocmd QuickFixCmdPost *grep* cwindow
