require("ricdotnet.lazy")

require("ricdotnet.telescope")
require("ricdotnet.lsp")
require("ricdotnet.git")
require("ricdotnet.icons")
require("ricdotnet.set")
require("ricdotnet.keys")
require("Comment").setup()

require("ricdotnet.theme").setup("catppuccin")
require("ricdotline").setup({
  wakatime = false,
  theme = "catppuccin_mocha",
  separator = "round",
})
require("ricdotmarker").setup()
