vim.keymap.set("n", "<leader>h", "<cmd>HurlRun<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap('v', '<leader>h', ":'<,'>HurlRun<CR>", { noremap = true })
