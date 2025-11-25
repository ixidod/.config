local M = {}
local warn_black_missing = false

local function notify_black_missing()
  if warn_black_missing then
    return
  end
  warn_black_missing = true
  vim.notify('Black formatter is not installed (pip install black)', vim.log.levels.WARN)
end

function M.format_with_black(bufnr)
  if vim.fn.executable('black') ~= 1 then
    notify_black_missing()
    return
  end

  local filename = vim.api.nvim_buf_get_name(bufnr)
  if filename == '' then
    filename = 'stdin.py'
  end

  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local input = table.concat(lines, '\n')
  if #lines > 0 then
    input = input .. '\n'
  end
  local job = vim
      .system(
        { 'black', '--quiet', '--stdin-filename', filename, '-' },
        { stdin = input, text = true }
      )
      :wait()

  if job.code ~= 0 then
    vim.notify(
      string.format('Black failed for %s: %s', filename, job.stderr or ''),
      vim.log.levels.ERROR
    )
    return
  end

  local output = job.stdout or ''
  output = output:gsub('\r', '')
  local formatted = vim.split(output, '\n', { plain = true })
  if formatted[#formatted] == '' then
    formatted[#formatted] = nil
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, formatted)
end

return M
