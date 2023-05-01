require("theprimeagen.set")
require("theprimeagen.remap")

-- DO NOT INCLUDE THIS
vim.opt.rtp:append("~/personal/streamer-tools")
-- DO NOT INCLUDE THIS

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-\\>', ':ToggleTerm direction=horizontal size=10<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-\\>v', ':ToggleTerm direction=vertical size=10<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-f>', ':ToggleTerm direction=float size=10<CR>', { noremap = true, silent = true })

local Terminal = require('toggleterm.terminal').Terminal

function _lazygit_toggle()
    local lazygit = Terminal:new({ cmd = "lazygit && exit", hidden = true, direction = "float" })
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>g', ':ToggleTerm direction=float size=10 cmd=lg<CR>', {noremap = true, silent = true})

require "lsp_signature".setup({})
vim.keymap.set({ 'n' }, '<C-k>', function()
    require('lsp_signature').toggle_float_win()
end, { silent = true, noremap = true, desc = 'toggle signature' })

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
    { silent = true, noremap = true }
)

require('bufferline').setup {
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                padding = 1,
                text_align = "center",
                separator = true
            }
        },
    }
}

vim.cmd('set laststatus=3')

vim.opt.termguicolors = true

require 'nvim-web-devicons'.setup {}

vim.opt.hidden = true

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

