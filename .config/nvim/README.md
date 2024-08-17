```bash

               ███▄    █ ▓█████  ▒█████
               ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒
              ▓██  ▀█ ██▒▒███   ▒██░  ██▒
              ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░
              ▒██░   ▓██░░▒████▒░ ████▓▒░
              ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░
              ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░
                 ░   ░ ░    ░   ░ ░ ░ ▒
                       ░    ░  ░    ░ ░

     =====       =====   =========  ========  ========
    || . .||   ||. . || ||. . . .|| \\. . .\\// . . //
    ||. . ||   || . .|| ||. . . .|| || . . .\/ . . .||
    || . .||   ||. . || || . . . || ||. . . . . . . ||
    ||. . ||   || . .|| ||. . . .|| || . | . . . . .||
    || . .||   ||. _-|| ||-_ . _-|| ||-_.|\ . . . . ||
    ||. . ||   ||-'  || ||  `-'  || ||  `|\_ . .|. .||
    || . _||   ||    || ||       || ||   |\ `-_/| . ||
    ||_-' ||  .|/    || ||       || ||   | \  / |-_.||
    ||    ||_-'      || ||       || ||   | \  / |  `||
    ||    `'         || ||       || ||   | \  / |   ||
    ||            .===' `===. .===' /==. |  \/  |   ||
    ||         .=='   \_|-_ `=' _-|/   `==  \/  |   ||
    ||      .=='    _-'    `-_-'   `-_  /|  \/  |   ||
    ||   .=='    _-'                  `' |. /|  |   ||
    ||.=='    _-'                         `' |  /==.||
    =='    _-'                                \/   `==
    \   _-'                                    `-_   /
     `''                                          ``'

```

## Plugins

Plugins are managed with [Lazy.nvim](https://github.com/folke/lazy.nvim). Plugins will automatically install on first start, and can be managed with `:Lazy`

Plugins are defined in [lua/nikarc/plugins/](https://github.com/nikarc/dotfiles/tree/main/.config/nvim/lua/nikarc/plugins). To install a new plugin, create a new file in this folder and return a dictionary with the plugin definition:

```lua
return {
    'repo-name/plugin-name',
    opt = {
        -- define options here
    },
    config = function()
        -- Call and setup plugin here
    end
}
```

## LSP

LSP is managed via [Mason.nvim](https://github.com/williamboman/mason.nvim). Some [LSP servers](https://github.com/nikarc/dotfiles/blob/main/.config/nvim/lua/nikarc/utils/init.lua#L47-L62) are predefined and installed on frist start.
Additional LSPs can be installed via the `:Mason` command

LSP setup is located in [`lua/nikarc/plugins/lsp`](https://github.com/nikarc/dotfiles/tree/main/.config/nvim/lua/nikarc/plugins/lsp)

## NVIM Options

General options are located in [`lua/nikarc/opt.lua`](https://github.com/nikarc/dotfiles/blob/main/.config/nvim/lua/nikarc/opt.lua).
Keymap changes are located in [`lua/nikarc/kepmap.lua`](https://github.com/nikarc/dotfiles/blob/main/.config/nvim/lua/nikarc/keymap.lua)

Some notable changes from default behavior:

- Clear highlights on `<Esc>`
- Keep cursor in middle of screen when jumping lines (search, `<C-u>/<C-d>`)
- Buffer navigation shortcuts (`bb` = previous buffer, `bn` = next buffer, `bw` = kill current buffer)
- Session management (saving buffer and window state after closing nvim): `<Space>ppe` to open menu of current sessions
- Relative line numbers: Current cursor line shows absolute line number in file, above and below are distance from current line (1, 2, 3, 4, 5)
- Remove whitespace on save
- Nvim uses system clipboard at all times
- No swapfiles/backup files

## After setting up this config:

Make sure to run `:checkhealth` to make sure dependencies are set up correctly
