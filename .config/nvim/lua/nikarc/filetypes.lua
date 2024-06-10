local exec = vim.api.nvim_exec

exec([[
  autocmd BufRead,BufNewFile *.env.local setfiletype sh
]], false)

