vim.cmd[[
    let g:airline#extensions#tabline#enabled = 1 "Automatically displays all buffers when there's only one tab open

    set statusline+=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)
    "上述命令会使状态栏显示文件路径、模式、文件类型、文件编码、所在行数与列数，
    "以及光标所在处是文件的百分之多少。配合 vim-airline 插件使用效果更佳。
]]
