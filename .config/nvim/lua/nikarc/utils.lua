local utils = {}

utils.border_chars_round = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }
utils.border_chars_none = { '', '', '', '', '', '', '', '' }
utils.border_chars_empty = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' }
utils.border_chars_inner_thick = { ' ', '▄', ' ', '▌', ' ', '▀', ' ', '▐' }
utils.border_chars_outer_thick = { '▛', '▀', '▜', '▐', '▟', '▄', '▙', '▌' }
utils.border_chars_cmp_items = { '▛', '▀', '▀', ' ', '▄', '▄', '▙', '▌' }
utils.border_chars_cmp_doc = { '▀', '▀', '▀', ' ', '▄', '▄', '▄', '▏' }
utils.border_chars_outer_thin = { '🭽', '▔', '🭾', '▕', '🭿', '▁', '🭼', '▏' }
utils.border_chars_inner_thin = { ' ', '▁', ' ', '▏', ' ', '▔', ' ', '▕' }
utils.border_chars_outer_thin_telescope = { '▔', '▕', '▁', '▏', '🭽', '🭾', '🭿', '🭼' }
utils.border_chars_outer_thick_telescope = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' }

return utils
