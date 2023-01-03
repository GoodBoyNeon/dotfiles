local status_ok, telescope = pcall(require, 'telescope')
local actions = require('telescope.actions')

telescope.load_extension('media_files')

if not status_ok then return end

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close,
      }
    }
  }
}
