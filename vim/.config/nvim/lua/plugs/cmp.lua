local cmp = require("cmp")
local compare = require("cmp.config.compare")
local lspkind = require("lspkind")
local kinds = require("cmp.types").lsp.CompletionItemKind

-- move magic methods to bottom
compare.under = require("cmp-under-comparator").under

-- lsp kinds order
-- https://github.com/onsails/lspkind.nvim/blob/master/lua/lspkind/init.lua
local kind_order = {
  "EnumMember",
  "Property",
  "Keyword",
  "Variable",
  "Snippet",
  "Text",
  "Method",
  "Function",
  "Constructor",
  "Field",
  "Class",
  "Interface",
  "Module",
  "Unit",
  "Value",
  "Enum",
  "Color",
  "File",
  "Reference",
  "Folder",
  "Constant",
  "Struct",
  "Event",
  "Operator",
  "TypeParameter",
}
local kind_priority_map = {}
for index, value in ipairs(kind_order) do
  kind_priority_map[value] = index
end
-- custom kind order function
compare.kind = function(entry1, entry2)
  local kind1 = kind_priority_map[kinds[entry1:get_kind()]] or 100
  local kind2 = kind_priority_map[kinds[entry2:get_kind()]] or 100

  if kind1 < kind2 then
    return true
  end
  return false
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api
        .nvim_buf_get_lines(0, line - 1, line, true)[1]
        :sub(col, col)
        :match("%s")
      == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes(key, true, true, true),
    mode,
    true
  )
end

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
  },
  sorting = {
    comparators = {
      compare.offset,
      compare.exact,
      compare.score,
      compare.recently_used,
      compare.locality,
      compare.under,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },
  formatting = {
    format = function(entry, vim_item)
      if vim.tbl_contains({ "path" }, entry.source.name) then
        local icon, hl_group =
          require("nvim-web-devicons").get_icon(entry:get_completion_item().label)
        if icon then
          vim_item.kind = icon
          vim_item.kind_hl_group = hl_group
          return vim_item
        end
      end
      return lspkind.cmp_format({ with_text = true })(entry, vim_item)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "vsnip" },
    { name = "path" },
  },
})

-- Use buffer source for `/` and `?`
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline", keyword_length = 3 },
  }),
})

-- Set completeopt to have a better completion experience
vim.opt.completeopt = { "menu", "noselect", "preview" }
