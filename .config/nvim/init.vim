" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath=&runtimepath
" source ~/.vimrc

lua require("init")
lua require("plugins")
lua require("mappings")
lua require("setup")

lua << EOF
-- Automatically :PackerCompile on update
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
EOF
