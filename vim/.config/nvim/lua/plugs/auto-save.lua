require("auto-save").setup({
  trigger_events = { "InsertLeave", "TextChanged", "FocusLost" },
  execution_message = { message = "" },
})
