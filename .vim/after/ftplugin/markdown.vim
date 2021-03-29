" ----- VARIABLE -----
let $VIMBROWSER='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
let $OPENBROWSER='nnoremap <F5> :!'. $VIMBROWSER .' %:p<CR>'


" ----- .md OPENER -----
augroup OpenMdFile
  autocmd!
  autocmd BufEnter *.md echom "Press F5 to Open .md File"
  " Trying to make a keybind to open brave from here
  autocmd BufEnter *.md exe $OPENBROWSER
augroup END
