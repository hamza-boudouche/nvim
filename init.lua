require("theprimeagen")

if vim.fn.has('wsl') == 1 then
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ['+'] = 'clip.exe',
            ['*'] = 'clip.exe',
        },
        paste = {
            ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
end


vim.defer_fn(function()
    vim.cmd('highlight GitSignsDelete guibg=NONE')
    vim.cmd('highlight GitSignsChange guibg=NONE')
    vim.cmd('highlight GitSignsAdd guibg=NONE')
end, 100)
