return {
  "tpope/vim-fugitive", -- git commands in nvim
  config = function()
    -- diff mode in vertical splits
    vim.opt.diffopt:append("vertical")

    -- save all buffers and open fugitive git status
    vim.keymap.set(
      "n",
      "<space>gs",
      ":wa | :Git<CR>",
      { noremap = true, silent = true }
    )

    vim.keymap.set("n", "<space>gh", "<cmd>diffget //2<CR>")
    vim.keymap.set("n", "<space>gl", "<cmd>diffget //3<CR>")

    -- no wrap for git commit long messages
    vim.api.nvim_exec(
      [[
        augroup NoWrap
          autocmd!
          autocmd Filetype gitcommit set formatoptions-=tl
        augroup END
      ]],
      false
    )
  end,
}
