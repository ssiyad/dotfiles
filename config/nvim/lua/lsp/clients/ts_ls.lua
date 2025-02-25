local location = '/opt/homebrew/lib/node_modules/@vue/typescript-plugin'

return {
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = location,
        languages = {
          'javascript',
          'typescript',
          'vue',
        },
      },
    },
  },
  filetypes = {
    'javascript',
    'javascript.jsx',
    'javascriptreact',
    'typescript',
    'typescript.tsx',
    'typescriptreact',
    'vue',
  },
}
