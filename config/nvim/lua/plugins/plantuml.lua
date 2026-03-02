return {
  "charlesnicholson/plantuml.nvim",

  ft = { "plantuml", "puml" }, -- Carga el plugin solo en archivos PlantUML

  opts = {
    auto_start = true,
    auto_update = true,
    http_port = 8764,
    plantuml_server_url = "http://www.plantuml.com/plantuml",
    auto_launch_browser = "never",
  },

  config = function(_, opts)
    require("plantuml").setup(opts)
    vim.keymap.set("n", "<leader>cp", ":PlantumlLaunchBrowser<CR>", { buffer = true, desc = "Preview PlantUML" })
    vim.keymap.set("n", "<leader>ce", ":!plantuml %<CR>", { buffer = true, desc = "Export PlantUML to PNG" } )
  end,
}
