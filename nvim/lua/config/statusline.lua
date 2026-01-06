local colors = {
  bg = '#1e1e2e',
  fg = '#cdd6f4',
  blue = '#89b4fa',
  green = '#a6e3a1',
  yellow = '#f9e2af',
  red = '#f38ba8',
  purple = '#cba6f7',
  gray = '#313244',
}
local function lsp_status()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if not clients or vim.tbl_isempty(clients) then
    return ''
  end

  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end

  return ' ' .. table.concat(names, ', ')
end
require('lualine').setup({
  options = {
    theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.blue },
        b = { fg = colors.fg, bg = colors.gray },
        c = { fg = colors.fg, bg = colors.bg },
      },
      insert = {
        a = { fg = colors.bg, bg = colors.green },
      },
      visual = {
        a = { fg = colors.bg, bg = colors.purple },
      },
      replace = {
        a = { fg = colors.bg, bg = colors.red },
      },
      inactive = {
        a = { fg = colors.fg, bg = colors.bg },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
      },
    },
    globalstatus = true,
    section_separators = { left = '', right = '' },
    component_separators = '|',
  },

  sections = {
    lualine_a = { { 'mode', separator = { left = '' } } },
    lualine_b = { { 'branch', left_padding = 1 } },
    lualine_c = {
      { 'filename', path = 1, padding = 1, symbols = { modified = '●' } },
    },
    lualine_x = {
      { 'diagnostics', padding = 1 },
      { lsp_status, padding = 1 },
    },
    lualine_y = { { 'filetype' }, { 'progress' } },
    lualine_z = { { 'location', separator = { right = '' } } },
  },
})
