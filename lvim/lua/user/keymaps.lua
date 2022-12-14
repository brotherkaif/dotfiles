lvim.builtin.which_key.mappings["p"] = {
  ":Telescope<CR>", "Command Palette"
}

lvim.builtin.which_key.mappings[" "] = {
  name = "easymotion",
  s = { ":HopChar<cr>", "Search character" },
  f = { ":HopChar1AC<cr>", "Find character forwards" },
  F = { ":HopChar1BC<cr>", "Find character backwards" },
  t = { ":HopChar1AC<cr>", "Til character forwards" },
  T = { ":HopChar1BC<cr>", "Til character backwards" },
  w = { ":HopWordAC<cr>", "Start of word forwards" },
  b = { ":HopWordBC<cr>", "Start of word backwards" },
  l = { ":HopWordAC<cr>", "Matches beginning & ending of word forwards" },
  h = { ":HopWordBC<cr>", "Matches beginning & ending of word backwards" },
  e = { ":HopWordAC<cr>", "End of word forwards" },
  ge = { ":HopWordBC<cr>", "End of word backwards" },
  j = { ":HopLineStartAC<cr>", "Start of line forwards" },
  k = { ":HopLineStartBC<cr>", "Start of line backwards" },
  ["/"] = { ":HopPattern<cr>", "Search n-character" },
}
