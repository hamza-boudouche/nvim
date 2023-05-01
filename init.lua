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
    vim.cmd("highlight BufferTabpageFill guibg=#00FFFFFF")
end, 100)


require 'lspconfig'.elixirls.setup {
    cmd = { "/home/hamzaboudouche/elixir-ls/language_server.sh" },
}

-- useful for writing lua nvim plugins

-- inspect some variable
P = function(v)
    print(vim.inspect(v))
    return v
end
