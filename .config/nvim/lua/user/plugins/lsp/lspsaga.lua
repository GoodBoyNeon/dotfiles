local status_ok, lspsaga = pcall(require, 'lspsaga')

if not status_ok then return end

lspsaga.init_lsp_saga {
  move_in_saga = { prev = '<C-k>', next = '<C-j>' },
  finder_action_keys = {
    open = '<CR>',
  },
  definition_action_keys = {
    edit = '<CR>',
  }
}
