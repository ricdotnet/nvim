require("ricdotnet.lazy")

require("ricdotnet.telescope")
require("ricdotnet.lsp")
require("ricdotnet.git")
require("ricdotnet.icons")
require("ricdotnet.set")
require("ricdotnet.keys")
require("Comment").setup()

require("ricdotnet.theme").setup("gruvbox")
require("ricdotline").setup({
  wakatime = true,
  theme = "gruvbox",
  separator = "tilt",
})

-- dev
-- require("ricdotmarker").setup()
