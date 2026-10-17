vim.lsp.config('harper_ls', {
  cmd = { 'harper-ls', '--stdio' },
  filetypes = { 'markdown', 'text', 'txt', 'gitcommit', 'tex', 'latex', 'rst', 'norg' },
  root_markers = { '.git' },
  settings = {
    ['harper-ls'] = {
      dialect = 'British',
      linters = {
        spell_check = true,
        sentence_capitalization = true,
        unclosed_quotes = true,
        wrong_quotes = false,
        long_sentences = true,
        repeated_words = true,
        spaces = true,
        matcher = true,
        correct_number_suffix = true,
      },
      codeActions = {
        forceStable = false,
      },
      markdown = {
        ignore_link_title = false,
      },
      diagnosticSeverity = 'hint',
      isolateEnglish = false,
    },
  },
})

vim.lsp.enable('harper_ls')
