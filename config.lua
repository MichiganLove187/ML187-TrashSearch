Config = {}

-- Cooldown between searches (in seconds)
Config.Cooldown = 120

-- Chance to find something (0-100)
Config.FindChance = 65

-- Maximum number of items that can be found in one search
Config.MaxItems = 1

-- Trash object hashes that can be searched
Config.TrashObjects = {
    -- Trash Cans
    [GetHashKey("prop_bin_01a")] = true,
    [GetHashKey("prop_bin_02a")] = true,
    [GetHashKey("prop_bin_05a")] = true,
    [GetHashKey("prop_bin_07a")] = true,
    [GetHashKey("prop_bin_07b")] = true,
    [GetHashKey("prop_bin_08a")] = true,
    [GetHashKey("prop_bin_08open")] = true,
    [GetHashKey("prop_bin_09a")] = true,
    [GetHashKey("prop_bin_07c")] = true,
    [GetHashKey("prop_bin_06a")] = true,
    [GetHashKey("prop_barrel_03d")] = true,
    
    -- Dumpsters
    [GetHashKey("prop_dumpster_01a")] = true,
    [GetHashKey("prop_dumpster_02a")] = true,
    [GetHashKey("prop_dumpster_02b")] = true,
    [GetHashKey("prop_dumpster_3a")] = true,
    [GetHashKey("prop_dumpster_4a")] = true,
    [GetHashKey("prop_dumpster_4b")] = true,
    
    -- Trash Bags-- Trash Boxes--trash tires
    [GetHashKey("prop_rub_binbag_01b")] = true,
    [GetHashKey("prop_rub_binbag_03b")] = true,
    [GetHashKey("prop_rub_cardpile_07")] = true,
    [GetHashKey("prop_rub_boxpile_09")] = true,
    [GetHashKey("prop_rub_boxpile_02")] = true,
    [GetHashKey("prop_rub_pile_03")] = true,
    [GetHashKey("prop_cratepile_05a")] = true,
    [GetHashKey("prop_rub_pile_04")] = true,
    [GetHashKey("prop_rub_binbag_05")] = true,
    [GetHashKey("prop_rub_binbag_06")] = true,
    [GetHashKey("prop_rub_binbag_03")] = true,
    [GetHashKey("prop_rub_binbag_04")] = true,
    [GetHashKey("prop_rub_boxpile_08")] = true,
    [GetHashKey("prop_rub_boxpile_01")] = true,
    [GetHashKey("prop_skid_trolley_1")] = true
}

-- Items that can be found in trash with their respective chances (out of 100)
Config.TrashItems = {
    -- Common Items (Higher Chance)
    {item = "rubber", chance = 30, min = 1, max = 3},
    {item = "diamond_ring", chance = 30, min = 1, max = 3},
    {item = "plastic", chance = 25, min = 1, max = 2},
    {item = "copper", chance = 25, min = 1, max = 3},
    {item = "electronics", chance = 20, min = 1, max = 2},
    {item = "steel", chance = 20, min = 1, max = 2},
    
    -- Uncommon Items (Medium Chance)
    {item = "aluminum", chance = 15, min = 1, max = 2},
    {item = "copper", chance = 15, min = 1, max = 2},
    {item = "electronics", chance = 10, min = 1, max = 1},
    {item = "steel", chance = 10, min = 1, max = 1},
    
    -- Rare Items (Low Chance)
    {item = "rolex", chance = 5, min = 1, max = 1},
    {item = "diamond_ring", chance = 3, min = 1, max = 1},
    {item = "goldchain", chance = 3, min = 1, max = 1},
    {item = "cryptostick", chance = 1, min = 1, max = 1},
}
