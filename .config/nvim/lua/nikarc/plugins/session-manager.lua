local Path = require('plenary.path')
local path_replacer = '@@'
local colon_replacer = '++'

local sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions')

return {
  'Shatur/neovim-session-manager',
  config = function()
    --- Replaces symbols into separators and colons to transform filename into a session directory.
    ---@param filename string: Filename with expressions to replace.
    ---@return table: Session directory
    local function session_filename_to_dir(filename)
      -- Get session filename.
      local dir = filename:sub(#tostring(sessions_dir) + 2)

      dir = dir:gsub(colon_replacer, ':')
      dir = dir:gsub(path_replacer, Path.path.sep)
      return Path:new(dir)
    end

    --- Replaces separators and colons into special symbols to transform session directory into a filename.
    ---@param dir string: Path to session directory.
    ---@return table: Session filename.
    local function dir_to_session_filename(dir)
      local filename = dir:gsub(':', colon_replacer)
      filename = filename:gsub(Path.path.sep, path_replacer)
      return Path:new(sessions_dir):joinpath(filename)
    end
    require('session_manager').setup({
      session_filename_to_dir = session_filename_to_dir,
      dir_to_session_filename = dir_to_session_filename,
    })
  end
}
