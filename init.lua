local init_path = debug.getinfo(1, "S").source:sub(2)
local base_dir = init_path:match("(.*[/\\])"):sub(1, -2)

if not vim.tbl_contains(vim.opt.rtp:get(), base_dir) then
    vim.opt.rtp:append(base_dir)
end

require("lvim.bootstrap"):init(base_dir)

require("lvim.config"):load()

local plugins = require "lvim.plugins"
require("lvim.plugin-loader").load {plugins, lvim.plugins}

local Log = require "lvim.core.log"
Log:debug "Starting LunarVim"

local commands = require "lvim.core.commands"
commands.load(commands.defaults)

require("lvim.lsp").setup()

-- cannot use <D-s> in mac. have to use iTerm2 global key shortcut cmd+s=:w\n
-- vim.api.nvim_set_keymap('n', '<D-s>', ':w<CR>', {noremap=true, silent=true, expr=false})

-- Disable Ex mode, beause what the fuck is that...
vim.api.nvim_set_keymap('n', 'Q',  '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'qq', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'q:', '', { noremap = true, silent = true })

-- sets outlined symbols as delimiters when undoing
vim.api.nvim_set_keymap('i', ',', ',<c-g>u', {noremap=true, silent=true, expr=false})
vim.api.nvim_set_keymap('i', '.', '.<c-g>u', {noremap=true, silent=true, expr=false})
vim.api.nvim_set_keymap('i', '!', '!<c-g>u', {noremap=true, silent=true, expr=false})
vim.api.nvim_set_keymap('i', '?', '?<c-g>u', {noremap=true, silent=true, expr=false})
vim.api.nvim_set_keymap('i', ';', ';<c-g>u', {noremap=true, silent=true, expr=false})
vim.api.nvim_set_keymap('i', ':', ':<c-g>u', {noremap=true, silent=true, expr=false})
vim.api.nvim_set_keymap('i', '-', '-<c-g>u', {noremap=true, silent=true, expr=false})

vim.api.nvim_set_keymap('n', '<leader><leader>f',  [[<Cmd>lua require('telescope.builtin').find_files({hidden=true, no_ignore=true, follow=true})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><leader>fb',  [[<Cmd>lua require('telescope.builtin').file_browser({hidden=true, no_ignore=true, follow=true})<CR>]], { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<leader><leader>f',  [[<Cmd>lua require('telescope.builtin').git_files()<CR>]], { noremap = true, silent = true }) 

vim.api.nvim_set_keymap('n', '<leader><leader>s',  [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><leader>sd',  [[<Cmd>lua require('telescope.builtin').grep_string({grep_open_files=true})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><leader>sb',  [[<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader><leader>gf',  [[<Cmd>lua require('telescope.builtin').git_status()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader><leader>b',  [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><leader>e',  [[<Cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><leader>p',  [[<Cmd>lua require('telescope.builtin').commands()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader><leader>t',  [[<Cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader><leader>y',  [[<Cmd>lua require('telescope.builtin').search_history()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><leader>t',  [[<Cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><leader>sbt',  [[<Cmd>lua require('telescope.builtin').current_buffer_tags()<CR>]], { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<leader><leader>H',  [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><leader>M',  [[<Cmd>lua require('telescope.builtin').man_pages()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><leader>q',  [[<Cmd>lua require('telescope.builtin').quickfix()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader><leader>hl',  [[<Cmd>lua require('telescope.builtin').highlights()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader><leader>map',  [[<Cmd>lua require('telescope.builtin').treesitter()<CR>]], { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<leader><leader>j',  [[<Cmd>lua require('telescope.builtin').lsp_document_diagnostics({line_width=80})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><leader>k',  [[<Cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]], { noremap = true, silent = true })