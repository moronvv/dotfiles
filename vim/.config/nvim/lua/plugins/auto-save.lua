return {
  "Pocco81/auto-save.nvim",
  -- TODO: move to main branch after empty msg fix
  branch = "dev",
  opts = {
    trigger_events = { "InsertLeave", "TextChanged", "FocusLost" },
    execution_message = { message = "" },
  },
}
