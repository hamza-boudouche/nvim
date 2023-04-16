local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

function vim.getVisualSelection()
    vim.cmd('noau normal! "vy"')
    local text = vim.fn.getreg('v')
    vim.fn.setreg('v', {})

    text = string.gsub(text, "\n", "")
    if #text > 0 then
        return text
    else
        return ''
    end
end

vim.keymap.set('v', '<leader>l', function()
    local text = vim.getVisualSelection()
    builtin.live_grep({ default_text = text })
end, { noremap = true, silent = true })

-- this still doesn't work for some reason
-- vim.keymap.set('n', '<leader>fl', '<cmd>Telescope current_buffer_fuzzy_find<cr>')

vim.keymap.set('n', '<leader>?', ':Telescope keymaps<CR>')
