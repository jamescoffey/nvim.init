vim.env.R_path = "d:/tools/R/R-4.4.1/bin/x64/"

require("cmp_r").setup({
  filetypes = {"r", "rmd", "quarto"},
  doc_width = 58,
  --quarto_intel = "~/Downloads/quarto-1.1.251/share/editor/tools/yaml/yaml-intelligence-resources.json"
})
