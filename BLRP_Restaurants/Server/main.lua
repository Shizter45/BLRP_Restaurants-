ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('BLRP_RESTAURANTS:BuyItem') -- 
AddEventHandler('BLRP_RESTAURANTS:BuyItem', function(item, price, location)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if price <= xPlayer.getMoney() then -- Checks if the price exceeds the players account money
        xPlayer.addInventoryItem(item, 1) -- Adds item to players inventory
        xPlayer.removeMoney(price) -- removes money
        xPlayer.showNotification("You purchased: ~y~" .. ESX.GetItemLabel(item)) -- I did not know what you notify with
    else
        xPlayer.showNotification('~r~[ERROR]~w~ Not enough money to purchase ~y~' .. ESX.GetItemLabel(item))
    end
end)
