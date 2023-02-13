return {
  "iamcco/markdown-preview.nvim",
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  config = function()
    vim.keymap.set("n", "<space>mp", ":MarkdownPreviewToggle<CR>", { noremap = true })
  end,
  ft = "markdown",
}
