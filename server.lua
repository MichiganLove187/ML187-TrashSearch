local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('ml187-trashsearch:server:giveItems')
AddEventHandler('ml187-trashsearch:server:giveItems', function(items)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    local foundItemsText = ""
    
    for _, item in pairs(items) do
        if QBCore.Shared.Items[item.item] then
            Player.Functions.AddItem(item.item, item.amount)
            
            if foundItemsText ~= "" then
                foundItemsText = foundItemsText .. ", "
            end
            foundItemsText = foundItemsText .. QBCore.Shared.Items[item.item].label .. " x" .. item.amount
            
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.item], "add")
        end
    end
    
    TriggerEvent('qb-log:server:CreateLog', 'trashsearch', 'Trash Search', 'green', Player.PlayerData.name .. ' found: ' .. foundItemsText)
end)
