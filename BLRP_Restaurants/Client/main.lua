ESX    = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(250)
    end
end)

-- Create blips
Citizen.CreateThread(function()
    if Config.ShowBlips == true then
        for k,v in pairs(Config.Locations) do
            local restaurantBlip = AddBlipForCoord(v.coord.x, v.coord.y, v.coord.z)
            SetBlipSprite(restaurantBlip, v.BlipSprite)
            SetBlipColour(restaurantBlip, v.BlipColor)
            SetBlipScale(restaurantBlip, v.BlipScale)
            SetBlipDisplay(restaurantBlip, 4)
            SetBlipAsShortRange(restaurantBlip, true)
            AddTextEntry('RESTRANT', v.name)
            BeginTextCommandSetBlipName('RESTRANT')
            EndTextCommandSetBlipName(restaurantBlip)
        end
    end
end)

--[[ Draws Markers at location If you 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        for k, v in pairs(Config.Locations) do
            local RestaurantLocation = vector3(v.coord.x, v.coord.y, v.coord.z)
            -- Draws the Marker
            DrawMarker(
                Config.MarkerIcon,
                RestaurantLocation.x+0.75,
                RestaurantLocation.y,
                RestaurantLocation.z-1.00,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                2.0,
                2.0,
                2.0,
                44,
                175,
                245,
                150,
                false,
                false,
                2,
                false,
                nil,
                nil,
                false
            )
        end
    end
end)
]]--

-- Checks Distance
Citizen.CreateThread(function() -- Also Taken from (https://github.com/Abel-Gaming/esx_Vending) (Sorry)
    while not NetworkIsSessionStarted() do -- Wait for the user to load
		Wait(500)
	end

    while true do
        Citizen.Wait(1)
        for k,v in pairs(Config.Locations) do
            local Coords = vector3(v.coord.x, v.coord.y, v.coord.z)
            if #(GetEntityCoords(PlayerPedId()) - Coords) <= 1.0 then
                ESX.Game.Utils.DrawText3D(markerlocation, "Press ~y~[E]~s~ to purchase items", 0.4)

				-- Check for button press
				if IsControlJustReleased(0, 51) then
					-- Open menu is the button is pressed
					OpenMenu(v.availableitems)

					-- Wait for menu control
					while ESX.UI.Menu.IsOpen("default", GetCurrentResourceName(), "general_menu") do
						Wait(50)
					end
                end
            end
        end
    end
end)
