return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<A-h>", "<cmd>BufferLineMovePrev<cr>", desc = "Move Buffer Left" },
      { "<A-l>", "<cmd>BufferLineMoveNext<cr>", desc = "Move Buffer Right" },
      { "<leader>bB", "<Cmd>BufferLineGroupClose pinned<CR>", desc = "Delete Pinned Buffers" },
    },
  },
}
