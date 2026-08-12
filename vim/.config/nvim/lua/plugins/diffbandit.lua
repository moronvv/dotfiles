return {
  {
    "CoreyKaylor/diffbandit.nvim",
    cmd = {
      "DiffBandit",
      "DiffBanditBuffers",
      "DiffBanditFolderDiff",
      "DiffBanditGit",
      "DiffBanditGitCurrent",
      "DiffBanditMerge",
    },
    opts = {
      merge = {
        auto_apply_non_conflicting = true,
      },
      ui = {
        theme = {
          highlights = {
            DiffBanditContext = { bg = "NONE" },
            DiffBanditHiddenSplit = { bg = "NONE" },
            DiffBanditSplit = { bg = "NONE" },
            DiffBanditOverviewContext = { bg = "NONE" },
            DiffBanditSignColumn = { bg = "NONE" },
            DiffBanditGap = { bg = "NONE" },
            DiffBanditPlaceholder = { bg = "NONE" },
            DiffBanditEmptyNotice = { bg = "NONE" },
            DiffBanditConnectorExpansionChange = { link = "DiffBanditConnectorChangeLine" },
            DiffBanditConnectorExpansionAdd = { link = "DiffBanditConnectorAddLine" },
            DiffBanditConnectorExpansionDelete = { link = "DiffBanditConnectorDeleteLine" },
            DiffBanditConnectorExpansionAddUnderline = { link = "DiffBanditConnectorAddLine" },
            DiffBanditConnectorContext = { bg = "NONE" },
          },
        },
      },
    },
  },
}
