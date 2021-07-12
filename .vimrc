set wrap
set number
set relativenumber
set cursorline
set hidden
filetype plugin on
set iskeyword+="-"
set clipboard+=unnamedplus

" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'tpope/vim-eunuch'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jparise/vim-graphql'
Plug 'heavenshell/vim-jsdoc', { 
  \ 'for': ['javascript', 'javascript.jsx','typescript'], 
  \ 'do': 'make install'
\}
" Plug 'ap/vim-css-color'
" CSS colors
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'develop' }
Plug 'vim-airline/vim-airline'
Plug 'mileszs/ack.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-crystalline'
Plug 'nikarc/inline_edit.vim'
Plug 'keith/swift.vim'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sirtaj/vim-openscad'
Plug 'ryanoasis/vim-devicons'
Plug 'lambdalisue/suda.vim'
" Plug 'zsugabubus/vim-paperplane'
" Plug 'wellle/context.vim'
" Plug 'justinmk/vim-sneak' " Search
" Plug 'vimpostor/vim-tpipeline'

" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" Optional:
Plug 'honza/vim-snippets'

" Colors
Plug 'haishanh/night-owl.vim'
Plug 'chuling/vim-equinusocio-material'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'rafalbromirski/vim-aurora'
" Plug '~/Documents/vim-purpura'
Plug 'nikarc/vim-purpura'
Plug 'skbolton/embark'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'arzg/vim-colors-xcode'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

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
" colorscheme material
" colorscheme xcodedark
" if !empty($VIM_COLORSCHEME)
"     colorscheme $VIM_COLORSCHEME
" else
"    colorscheme purpura
" endif
" colorscheme spaceduck
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
let g:crystalline_theme = 'onedark'
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

" Folding
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

function! MyFoldText()
    let line = getline(v:foldstart)
    let foldedlinecount = v:foldend - v:foldstart + 1
    return ' ⭐️ '. foldedlinecount . line
endfunction
set foldtext=MyFoldText()
set fillchars=fold:\

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

" @p - Regex search/replace to fix openening brackets with no space before it
let @p=':%s/\(\s\|(\)\@<!{/ {/g'
" @o - Converts Backbone event key to jQuery event handler
let @o=":s/'\([a-zA-Z-]\+\) \(\.\|\#\)': "

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
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" 
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Use <C-l> for trigger snippet expand.
"imap <C-l> <Plug>(coc-snippets-expand)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-tab>'
command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-snippets',
    \ 'coc-sourcekit',
    \ 'coc-styled-components',
    \ 'coc-tailwindcss',
    \ 'coc-tsserver',
    \ 'coc-clangd',
    \ 'coc-prettier'
    \]

let g:snipMate = { 'snippet_version' : 1 }

" Vim airline show buffers
let g:airline#extensions#tabline#enabled = 1

" ACK.vim
" Auto close Ack pane on selection
let g:ack_autoclose = 1
cnoreabbrev Ack Ack!
if executable('ag')
    let g:ackprg = 'ag --path-to-ignore ~/.ignore --vimgrep'
endif
"******* End User Settings ***********

" Color Stuff
"hi CursorLineNr ctermfg=204

" ALE Settings
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\   'vue': ['eslint']
\}

" Vim Sneak
" let g:sneak#label = 1
" map / <Plug>Sneak_s
" map ? <Plug>Sneak_S
" map f <Plug>Sneak_f
" map F <Plug>Sneak_F

" IndentLine
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_fileTypeExclude = ['tex', 'markdown', 'json', 'dockerfile']

" Prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Auto Pairs
if exists("g:AutoPairsShortcutToggle")
    unlet g:AutoPairsShortcutToggle
endif
