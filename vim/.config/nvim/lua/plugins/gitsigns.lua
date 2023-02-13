return {
  "lewis6991/gitsigns.nvim", -- git signs
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or { noremap = true, silent = true }
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "]g", function()
        if vim.wo.diff then
          return "]g"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      map("n", "[g", function()
        if vim.wo.diff then
          return "[g"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      map({ "n", "v" }, "<leader>gu", ":Gitsigns reset_hunk<CR>")
      map("n", "<leader>gi", gs.preview_hunk)
      map("n", "<leader>gb", function()
        gs.blame_line({ full = true })
      end)
    end,
  },
}
