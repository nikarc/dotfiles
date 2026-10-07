return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local ensure_installed = {
      'bash', 'c', 'cpp', 'css', 'graphql', 'html', 'javascript', 'json',
      'lua', 'markdown', 'markdown_inline', 'python', 'query',
      'svelte', 'tsx', 'typescript', 'vim', 'vimdoc', 'yaml',
    }

    require('nvim-treesitter').install(ensure_installed)

    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match) or args.match
        if vim.treesitter.language.add(lang) then
          vim.treesitter.start(args.buf, lang)
        end
      end,
    })
  end,
}
