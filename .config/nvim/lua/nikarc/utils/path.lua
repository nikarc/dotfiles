M = {}

M.normalize_path = function(path)
  return path:gsub("\\", "/")
end

M.normalize_cwd = function()
  return M.normalize_path(vim.loop.cwd()) .. "/"
end

M.is_subdirectory = function(cwd, path)
  return string.lower(path:sub(1, #cwd)) == string.lower(cwd)
end

M.split_filepath = function(path)
  local normalized_path = M.normalize_path(path)
  local normalized_cwd = M.normalize_cwd()
  local filename = normalized_path:match("[^/]+$")

  if M.is_subdirectory(normalized_cwd, normalized_path) then
    local stripped_path = normalized_path:sub(#normalized_cwd + 1, -(#filename + 1))
    return stripped_path, filename
  else
    local stripped_path = normalized_path:sub(1, -(#filename + 1))
    return stripped_path, filename
  end
end

return M
