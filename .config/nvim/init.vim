" basic settings
syntax enable 
set title
set number relativenumber
set nowrap
set smartindent
set incsearch
set showcmd
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab
" configuring leader key
noremap <SPACE> <Nop>
let mapleader = " "
" jumping windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>n :FZF<CR>
nnoremap <leader>e :Explore<CR>

" imap ii <Esc> 
" Useless lol
" map <C-{> <Esc> <CR>
map <C-n> :NERDTreeToggle<CR>
" fugitive mappings
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gu :Gpush<CR>
nnoremap <leader>gp :Gpull<CR>
nnoremap <leader>gs :G<CR>

" latex
autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!

" imap ii <Esc> 
map <C-s> :w <CR>
map <C-n> :NERDTreeToggle<CR>
" nnoremap <C-d> :term<CR>
" Opening nerdtree if no file was opened
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

call plug#begin("~/.config/nvim/plugged")

" Plug 'arcticicestudio/nord-vim'
" Plug 'neoclide/coc.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-highlightedyank'
Plug 'vifm/vifm.vim'
Plug 'rust-lang/rust.vim'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
" Plug 'mattn/emmet-vim'
" Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-highlightedyank'
Plug 'vifm/vifm.vim'
" Plug 'rust-lang/rust.vim'
Plug 'preservim/nerdtree'
" Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'thosakwe/vim-flutter'

call plug#end()
