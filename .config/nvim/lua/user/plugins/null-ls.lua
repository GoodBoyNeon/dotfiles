local status_ok, null_ls = pcall(require, 'null_ls');

if not status_ok then
  return
end

null_ls.setup({
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.diagnostics.eslint,
})
