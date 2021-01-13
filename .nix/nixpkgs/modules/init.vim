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
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>wc :wincmd c<CR>
nnoremap <leader>wv :wincmd v<CR>
nnoremap <leader>ws :wincmd s<CR>
nnoremap <leader>wo :wincmd o<CR>
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

" vim rooter configuration
let g:rooter_patterns = ['.git']

let g:tex_flavor = 'latex'
" latex
autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!

" imap ii <Esc> 
map <C-s> :w <CR>
map <C-n> :NERDTreeToggle<CR>
" nnoremap <C-d> :term<CR>
" Opening nerdtree if no file was opened
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif