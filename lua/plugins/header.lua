local plugin = {
	"attilarepka/header.nvim",
	config = true,
	opts = {
		file_name = true,
		author = "James Coffey",
		project = nil,
		date_created = false,
		date_created_fmt = "%Y-%m-%d %H:%M:%S",
		date_modified = true,
		date_modified_fmt = "%Y-%m-%d %H:%M:%S",
		line_separator = "------",
		copyright_text = "Copyright (c) 2025 QRisk Stratergies Pty Ltd",
		license_from_file = false,
	},
	-- {
	-- 	"Diogo-ss/42-header.nvim",
	-- 	cmd = { "Stdheader" },
	-- 	keys = { "<F1>" },
	-- 	opts = {
	-- 		default_map = true, -- Default mapping <F1> in normal mode.
	-- 		auto_update = true, -- Update header when saving.
	-- 		user = "James Coffey", -- Your user.
	-- 		mail = "James.Coffey@qriskstrat.com", -- Your mail.
	-- 		-- add other options.
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("42header").setup(opts)
	-- 	end,
	-- },
}
return plugin
