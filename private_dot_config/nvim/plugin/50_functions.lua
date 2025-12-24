-- ┌────────────────┐
-- │ User Functions │
-- └────────────────┘
--
-- This file contains custom user defined functions.

-- Tabpage with lazygit
Config.open_lazygit = function()
  vim.cmd('tabedit')
  vim.cmd('setlocal nonumber signcolumn=no')

  -- Unset vim environment variables to be able to call `vim` without errors
  -- Use custom `--git-dir` and `--work-tree` to be able to open inside
  -- symlinked submodules
  vim.fn.termopen('VIMRUNTIME= VIM= lazygit --git-dir=$(git rev-parse --git-dir) --work-tree=$(realpath .)', {
    on_exit = function()
      vim.cmd('silent! :checktime')
      vim.cmd('silent! :bw')
    end,
  })
  vim.cmd('startinsert')
  vim.b.minipairs_disable = true
end

-- Automatic hemisphere detection based on timezone offset
local function get_hemisphere()
    -- Get offset in seconds from UTC
    local now = os.time()
    local utc_offset = os.difftime(now, os.time(os.date('!*t', now)))

    -- This is a heuristic: Most Southern Hemisphere countries
    -- with significant populations are in specific offset ranges.
    -- However, it's safer to check for specific Timezone names if your OS allows.

    -- Better yet: Use the 'timedatectl' or 'date' command via shell
    local timezone = vim.fn.system('date +%Z'):gsub('%s+', '')

    -- Common Southern Timezones: ACST, AEST, AWST (Australia),
    -- BRT (Brazil), SAST (South Africa), etc.
    local southern_zones = { 'ACST', 'AEST', 'AWST', 'BRT', 'SAST', 'NZST' }

    for _, zone in ipairs(southern_zones) do
        if timezone == zone then return 'south' end
    end

    return 'north' -- Default
end

-- Seasonal colorscheme
Config.set_seasonal_scheme = function()
    -- SETTING: 'north' or 'south'
    local hemisphere = get_hemisphere()

    local month = tonumber(os.date('%m'))
    local theme = ''

    -- Seasonal Mappings
    local seasons = {
        north = {
            winter = {12, 1, 2},
            spring = {3, 4, 5},
            summer = {6, 7, 8},
            autumn = {9, 10, 11},
        },
        south = {
            summer = {12, 1, 2},
            autumn = {3, 4, 5},
            winter = {6, 7, 8},
            spring = {9, 10, 11},
        }
    }

    -- Helper to check if month is in a list
    local function has_value(tab, val)
        for _, value in ipairs(tab) do
            if value == val then return true end
        end
        return false
    end

    -- Logic to select theme
    local h = seasons[hemisphere]
    if has_value(h.winter, month) then theme = 'miniwinter'
    elseif has_value(h.spring, month) then theme = 'minispring'
    elseif has_value(h.summer, month) then theme = 'minisummer'
    else theme = 'miniautumn'
    end

    vim.cmd('colorscheme ' .. theme)
end

Config.set_seasonal_scheme()
