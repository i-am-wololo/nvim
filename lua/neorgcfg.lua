require('neorg').setup {
    load = {
        ["core.defaults"] = {},
	["core.dirman"] = {
		config = {
			 	workspaces = {
					notes = "~/Documents/NotesNeorg/"
				}
			}
	},
	["core.integrations.treesitter"] = {},
  	["core.concealer"] = { config = { icon_preset = "diamond" } },
	["core.export"] = {}
    }
}

