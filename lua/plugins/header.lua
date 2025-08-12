local plugin = {
	"attilarepka/header.nvim",
	config = true,
	opts = {
		file_name = true,
		author = "James Coffey",
		project = nil,
		date_created = true,
		date_created_fmt = "%Y-%m-%d %H:%M:%S",
		date_modified = true,
		date_modified_fmt = "%Y-%m-%d %H:%M:%S",
		line_separator = "------",
		copyright_text = "Copyright (c) 2025 QRisk Stratergies Pty Ltd",
		license_from_file = false,
	},
}
return plugin
