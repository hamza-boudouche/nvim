vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)

vim.keymap.set('n', '<leader>;', function()
    -- If we find a floating window, close it.
    local found_float = false
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(win).relative ~= '' then
            vim.api.nvim_win_close(win, true)
            found_float = true
        end
    end

    if found_float then
        return
    end

    vim.diagnostic.open_float(nil, { focus = false, scope = 'cursor' })
end, { desc = 'Toggle Diagnostics' })

function enableLineWrapForTrouble()
    -- Check if the current buffer's file type is "Trouble"
    if vim.bo.filetype == "Trouble" then
        -- Enable line wrap
        vim.wo.wrap = true
    else
        -- Disable line wrap
        vim.wo.wrap = false
    end
end

-- Set up an autocmd to trigger the function when a buffer is loaded
vim.cmd([[
augroup LineWrapForTrouble
    autocmd!
    autocmd BufEnter * lua enableLineWrapForTrouble()
augroup END
]])
