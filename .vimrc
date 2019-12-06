set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript'
Plug 'altercation/vim-colors-solarized'
" Plug 'junegunn/fzf'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-eunuch'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-liquid'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'mileszs/ack.vim'
Plug 'RRethy/vim-illuminate'
" Plug 'MattesGroeger/vim-bookmarks'
" Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'SirVer/ultisnips'
"Plug 'landaire/deoplete-swift'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Valloric/MatchTagAlways'
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Colorschemes
Plug 'rainglow/vim'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'romainl/Apprentice'
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/base16-vim'
Plug 'tomasr/molokai'
Plug 'haishanh/night-owl.vim'

call plug#end()

if (has("termguicolors"))
 set termguicolors
endif

set relativenumber

syntax enable
" set background=dark
" colorscheme nord 
" colorscheme apprentice 
" colorscheme base16-eighties
" colorscheme molokai
colorscheme night-owl

let g:gruvbox_contrast_dark = 'soft'
set guifont=Monaco:h16

set ignorecase
set smartcase
set number

set rtp+=/usr/local/opt/fzf
set laststatus=2
set noshowmode
set backspace=2

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Save swap files somewhere not in file directory
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Copy filename to clipboard
nmap ,cs :let @"=substitute(expand("%:t"), "\.liquid$", "", "")<CR>

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Keybindings
nnoremap <silent> <Space> :NERDTreeToggle<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> ,<space> :noh<CR>
" nnoremap <C-p> :FZF<CR>
xnoremap \$ g_
nnoremap <silent> tt :tabe<CR>

" Buffer stuff
" nnoremap <silent> bn :bn<CR>
" nnoremap <silent> bb :bp<CR>
" nnoremap <silent> bo :%bd\|e#<CR>
" nnoremap <silent> bd :bdelete<CR>


map y$ Y

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let g:javascript_highlight_functions = 1

" Auto close Ack pane on selection
let g:ack_autoclose = 1


let g:surround_{char2nr('o')} = "{% comment %}\r{% endcomment %}"

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-y>."
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

" Deoplete: use tab to forward cycle
" inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Coc.nvm: use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" FZF use .gitignore when searching
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" DocBlockr
" nnoremap <C-_> :call append(line('^'), )<CR>

set foldmethod=indent
set nofoldenable

" Vim airline buffer tabs
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'

" LeaderF Config
let g:Lf_WindowPosition = 'popup'
nnoremap <silent> <C-p> :Leaderf file<CR>
