return {
  "klen/nvim-test",
  init = function()
    vim.keymap.set("n", "<space>ts", ":TestSuite<CR>", { noremap = true })
    vim.keymap.set("n", "<space>tf", ":TestFile<CR>", { noremap = true })
    vim.keymap.set("n", "<space>tn", ":TestNearest<CR>", { noremap = true })
    vim.keymap.set("n", "<space>tl", ":TestLast<CR>", { noremap = true })
  end,
  cmd = { "TestSuite", "TestFile", "TestNearest", "TestLast" },
  config = function()
    require("nvim-test").setup({
      termOpts = {
        direction = "float",
        width = 144,
        height = 30,
      },
    })

    -- custom parameters
    require("nvim-test.runners.pytest"):setup({
      args = { "-s", "-v" },
    })
  end,
}
