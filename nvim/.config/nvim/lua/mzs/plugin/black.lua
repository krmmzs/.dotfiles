vim.cmd[[
augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end
]]
