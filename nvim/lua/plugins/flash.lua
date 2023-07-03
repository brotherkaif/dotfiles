return {
	"folke/flash.nvim",
	event = "VeryLazy",

	opts = {},
	keys = {
		{
			"<s-cr>",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump({
					search = { mode = "search" },
					label = { after = false, before = { 0, 0 }, uppercase = false },
					pattern = [[\<\|\>]],
					action = function(match, state)
						state:hide()
						require("flash").jump({
							search = { max_length = 0 },
							label = { distance = false },
							highlight = { matches = false },
							matcher = function(win)
								return vim.tbl_filter(function(m)
									return m.label == match.label and m.win == win
								end, state.results)
							end,
						})
					end,
					labeler = function(matches, state)
						local labels = state:labels()
						for m, match in ipairs(matches) do
							match.label = labels[math.floor((m - 1) / #labels) + 1]
						end
					end,
				})
			end,
			desc = "Jump",
		},
	},
}
