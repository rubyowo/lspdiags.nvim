function! s:complete(arg,line,pos) abort
  return join(sort(luaeval('vim.tbl_keys(require("trouble.providers").providers)')), "\n")
endfunction

command! -nargs=* -complete=custom,s:complete LspDiags lua require'lspdiags.actions'.open()
command! -nargs=* -complete=custom,s:complete LspDiagsToggle lua require'lspdiags.actions'.toggle()
command! LspDiagsClose lua require'lspdiags.actions'.close()
command! LspDiagsRefresh lua require'lspdiags.actions'.update_list()
