local location = '/opt/homebrew/lib/node_modules/@vue/typescript-plugin'
local languages = {
  'javascript',
  'typescript',
  'vue',
}

return {
  init_options = {
    plugins = {
      name = '@vue/typescript-plugin',
      locations = location,
      languages = languages,
    },
  },
  filetypes = languages,
}
