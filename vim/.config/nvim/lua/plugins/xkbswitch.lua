return {
  "lyokha/vim-xkbswitch", -- lang switcher
  init = function()
    vim.g.XkbSwitchEnabled = 3
    vim.g.XkbSwitchLib = "/usr/local/lib/libInputSourceSwitcher.dylib"
  end,
}
