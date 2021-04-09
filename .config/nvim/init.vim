call plug#begin('~/.local/share/nvim/plugged')
  Plug 'APZelos/blamer.nvim'
  Plug 'mxw/vim-jsx'
  Plug 'pangloss/vim-javascript'
  Plug 'altercation/vim-colors-solarized'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'neoclide/coc.nvim'
  Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-surround'
call plug#end()

set cindent
set clipboard=unnamedplus
set encoding=utf8
set expandtab
set ignorecase
set shiftwidth=2
set smartcase
set smarttab
set splitbelow
set splitright
set tabstop=2

" airline
let g:airline_theme='solarized'

" vim-colors-solarized
syntax enable
set background=light
colorscheme solarized

" maps
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-p> :FZF<CR>