set wrap
set number
set relativenumber
set cursorline
set hidden

call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'tpope/vim-eunuch'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'ap/vim-css-color'
" CSS colors
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'mileszs/ack.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-crystalline'
Plug 'nikarc/inline_edit.vim'

" Colors
Plug 'haishanh/night-owl.vim'
Plug 'chuling/vim-equinusocio-material'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'rafalbromirski/vim-aurora'
Plug '~/Documents/vim-purpura'
Plug 'skbolton/embark'

call plug#end()
" End VimPlug settings

" Syntax settings
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
" colorscheme night-owl
colorscheme purpura
" colorscheme embark
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
" Night Owl Lightline setup
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ }
"let g:lightline = {
"  \ 'colorscheme': 'equinusocio_material',
"  \ }
let g:crystalline_theme = 'purpura'
" Hexokinase settings
let g:Hexokinase_refreshEvents = [
    \ "BufRead",
    \ "InsertLeave"
    \]
let g:Hexokinase_highlighters = ["backgroundfull"]

" hi jsOperator guifg=#c792ea ctermfg=176 gui=NONE cterm=NONE
" End Syntax Settings

" Swap files
" Save swap files somewhere not in file directory
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
" End Swap Files

"*****************
"  User settings
"*****************

" Clear search highlight on ESC
nnoremap <silent> <Esc> :noh<CR><Esc>
" Copy filename to clipboard
nmap ,cs :let @"=substitute(expand("%:t"), "\.liquid$", "", "")<CR>
nmap ,ccs :let @*=substitute(expand("%:t"), "\.liquid$", "", "")<CR>

" Spacemacs style buffer switching
nnoremap <space>bp :bp<CR>
nnoremap <space>bn :bn<CR>

" Set spacebar to open file explorer
" nnoremap <silent> <Space> :Explore<CR>
" Clear search highlight
nnoremap <silent> ,<space> :noh<CR>
" Open new tab using tt
nnoremap <silent> tt :tabe<CR>
" Add ; to end of line
nnoremap <silent> ,; A;<Esc>
" Add , to end of line
nnoremap <silent> ,, A,<Esc>
" Go to middle of line
nnoremap ,g :exe 'normal! '.(virtcol('$')/2).'\|'<cr>
" Remap next search result to center on screen
nnoremap n nzz
" Buffer stuff
nnoremap <silent> bn :bn<CR>
nnoremap <silent> bb :bp<CR>
nnoremap <silent> bo :%bd\|e#<CR>
nnoremap <silent> bd :bwipeout<CR>
"set nofoldenable
" LeaderF Config
let g:Lf_WindowPosition = 'popup'
nnoremap <silent> <C-p> :Leaderf file<CR>

" Syntax highlight debug
map ,h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Coc.nvim
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Vim airline show buffers
let g:airline#extensions#tabline#enabled = 1

" Auto close Ack pane on selection
let g:ack_autoclose = 1
"******* End User Settings ***********

" Color Stuff
"hi CursorLineNr ctermfg=204

" ALE Settings
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\   'vue': ['eslint']
\}

