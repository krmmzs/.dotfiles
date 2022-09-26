local nnoremap = require("mzs.keymap").nnoremap

--[[ nnoremap("<leader>pv", "<cmd>Ex<CR>") ]]
-- nnoremap("\\", "cd %:h<CR> :terminal<CR>")

-- inoremap(",", ",<c-g>u")
-- inoremap(".", ".<c-g>u")
-- inoremap("!", "!<c-g>u")
-- inoremap("?", "?<c-g>u")
-- inoremap("<CR>", "<CR><c-g>u")

-- Y as same meran like D and C
-- nnoremap("Y", "y$")

-- moving text
-- vnoremap("J" ":m '>+1<CR>gv=gv")
-- vnoremap("K" ":m '<-2<CR>gv=gv")

-- Keeping it contered
-- nnoremap("n", "nzz")
-- nnoremap("N", "Nzz")
-- nnoremap("J", "mzJ'z")


-- Jumplist mutations, solve jump list could save <number>j or <number>k
-- noremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
-- noremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
