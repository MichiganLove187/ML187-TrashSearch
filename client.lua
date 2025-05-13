local QBCore = exports['qb-core']:GetCoreObject()
local searched = {}
local canSearch = true

local function hasBeenSearched(entity)
    for i = 1, #searched do
        if searched[i].entity == entity then
            if searched[i].time + Config.Cooldown > GetGameTimer() / 1000 then
                return true
            else
                table.remove(searched, i)
                return false
            end
        end
    end
    return false
end

local function searchTrash(entity)
    if not canSearch then
        QBCore.Functions.Notify("You're already searching...", "error")
        return
    end
    
    if hasBeenSearched(entity) then
        QBCore.Functions.Notify("This has been searched recently...", "error")
        return
    end
    
    canSearch = false
    
    table.insert(searched, {entity = entity, time = GetGameTimer() / 1000})
    
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
    
    QBCore.Functions.Progressbar("search_trash", "Searching trash...", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        ClearPedTasks(PlayerPedId())
        
        if math.random(1, 100) <= Config.FindChance then
            local itemsFound = 0
            local itemsTable = {}
            
            local itemCount = math.random(1, Config.MaxItems)
            
            for i = 1, itemCount do
                for _, item in pairs(Config.TrashItems) do
                    if math.random(1, 100) <= item.chance then
                        local amount = math.random(item.min, item.max)
                        
                        local found = false
                        for idx, foundItem in pairs(itemsTable) do
                            if foundItem.item == item.item then
                                itemsTable[idx].amount = itemsTable[idx].amount + amount
                                found = true
                                break
                            end
                        end
                        
                        if not found then
                            table.insert(itemsTable, {item = item.item, amount = amount})
                        end
                        
                        itemsFound = itemsFound + 1
                        break 
                    end
                end
            end
            
            if itemsFound > 0 then
                TriggerServerEvent('ml187-trashsearch:server:giveItems', itemsTable)
                QBCore.Functions.Notify("You found something!", "success")
            else
                QBCore.Functions.Notify("You didn't find anything useful...", "error")
            end
        else
            QBCore.Functions.Notify("You didn't find anything useful...", "error")
        end
        
        canSearch = true
    end, function() 
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify("Stopped searching...", "error")
        canSearch = true
    end)
end

Citizen.CreateThread(function()
    exports['qb-target']:AddTargetModel(getModelKeys(Config.TrashObjects), {
        options = {
            {
                type = "client",
                event = "ml187-trashsearch:client:searchTrash",
                icon = "fas fa-dumpster",
                label = "Search Trash",
            },
        },
        distance = 2.0
    })
end)

function getModelKeys(tbl)
    local models = {}
    for k, v in pairs(tbl) do
        local model = k
        if type(k) == "number" then
            for _, modelName in ipairs({
                "prop_bin_01a", "prop_bin_03a", "prop_bin_05a", "prop_bin_07a", 
                "prop_bin_08a", "prop_bin_08open", "prop_bin_09a",
                "prop_dumpster_01a", "prop_dumpster_02a", "prop_dumpster_02b", 
                "prop_dumpster_3a", "prop_dumpster_4a", "prop_dumpster_4b",
                "prop_garbage_bag_01", "prop_cs_street_binbag_01"
            }) do
                if GetHashKey(modelName) == k then
                    model = modelName
                    break
                end
            end
        end
        table.insert(models, model)
    end
    return models
end

RegisterNetEvent('ml187-trashsearch:client:searchTrash')
AddEventHandler('ml187-trashsearch:client:searchTrash', function(data)
    local entity = data.entity
    if Config.TrashObjects[GetEntityModel(entity)] then
        searchTrash(entity)
    end
end)
