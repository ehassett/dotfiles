" Use Pathogen
execute pathogen#infect()

" Theme settings
let g:solarized_termcolors=256
syntax enable
colorscheme solarized
:highlight Normal ctermbg=236
:highlight LineNR ctermfg=33 ctermbg=236
:highlight Identifier ctermfg=39
:set tabstop=2
:set shiftwidth=2
:set expandtab
:set number

" NERDTree settings
"" Open NERDTree by default with cursor in file
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
"" Toggle NERDTree with ,n
let mapleader = ","
nmap <leader>n :NERDTreeToggle<cr>
"" Clean up the UI
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Custom mapping
"" Window navigation
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l
