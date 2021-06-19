" basic settings
syntax enable
set title
set number relativenumber
set nowrap
set smartindent
set incsearch

" bar settings
set showcmd
set showmode
set ruler

" set tabstop=8
" set softtabstop=8
" set shiftwidth=8
" set noexpandtab
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

" fzf
nnoremap <leader>f :FZF<CR>
" file explorer
nnoremap <leader>e :Explore<CR>
" jump to last opened file
nnoremap <leader><Tab> :e #<CR>

" fugitive mappings
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gu :Git push<cr>
nnoremap <leader>gp :Git pull<cr>
nnoremap <leader>gs :Git<CR>

" vim rooter configuration
let g:rooter_patterns = ['.git']

" latex
let g:tex_flavor = 'latex'
" autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!
" strip trailing whitespace on save: https://howchoo.com/vim/vim-how-to-remove-trailing-whitespace-on-save
autocmd BufWritePre * :%s/\s\+$//e

" imap ii <Esc>
map <C-s> :w <CR>
map <C-n> :NERDTreeToggle<CR>
" Opening nerdtree if no file was opened
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
