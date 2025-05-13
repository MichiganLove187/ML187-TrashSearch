Config = {}

-- Cooldown between searches (in seconds)
Config.Cooldown = 60

-- Chance to find something (0-100)
Config.FindChance = 65

-- Maximum number of items that can be found in one search
Config.MaxItems = 1

-- Trash object hashes that can be searched
Config.TrashObjects = {
    -- Trash Cans
    [GetHashKey("prop_bin_01a")] = true,
    [GetHashKey("prop_bin_03a")] = true,
    [GetHashKey("prop_bin_05a")] = true,
    [GetHashKey("prop_bin_07a")] = true,
    [GetHashKey("prop_bin_08a")] = true,
    [GetHashKey("prop_bin_08open")] = true,
    [GetHashKey("prop_bin_09a")] = true,
    
    -- Dumpsters
    [GetHashKey("prop_dumpster_01a")] = false,
    [GetHashKey("prop_dumpster_02a")] = false,
    [GetHashKey("prop_dumpster_02b")] = false,
    [GetHashKey("prop_dumpster_3a")] = false,
    [GetHashKey("prop_dumpster_4a")] = false,
    [GetHashKey("prop_dumpster_4b")] = false,
    
    -- Trash Bags
    [GetHashKey("prop_garbage_bag_01")] = true,
    [GetHashKey("prop_cs_street_binbag_01")] = true
}

-- Items that can be found in trash with their respective chances (out of 100)
Config.TrashItems = {
    -- Common Items (Higher Chance)
    {item = "rubber", chance = 30, min = 1, max = 3},
    {item = "rubber", chance = 30, min = 1, max = 3},
    {item = "rubber", chance = 25, min = 1, max = 2},
    {item = "rubber", chance = 25, min = 1, max = 3},
    {item = "rubber", chance = 20, min = 1, max = 2},
    {item = "rubber", chance = 20, min = 1, max = 2},
    
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
