require("ricdotnet.lazy")

require("ricdotnet.telescope")
require("ricdotnet.lsp")
require("ricdotnet.git")
require("ricdotnet.icons")
require("ricdotnet.set")
require("ricdotnet.keys")
require("Comment").setup()

require("ricdotnet.theme").setup("tokyonight")
require("ricdotline").setup({
  wakatime = false,
  theme = "material",
  separator = "round",
})
require("ricdotmarker").setup()
