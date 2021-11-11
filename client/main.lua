QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = {}

local function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job

    if PlayerJob.name == "reporter" then
        local blip = AddBlipForCoord(Config.Locations["vehicle"].coords.x, Config.Locations["vehicle"].coords.y, Config.Locations["vehicle"].coords.z)
        SetBlipSprite(blip, 225)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.6)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, 1)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Locations["vehicle"].label)
        EndTextCommandSetBlipName(blip)
    end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo

    if PlayerJob.name == "reporter" then
        local blip = AddBlipForCoord(Config.Locations["vehicle"].coords.x, Config.Locations["vehicle"].coords.y, Config.Locations["vehicle"].coords.z)
        SetBlipSprite(blip, 225)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.6)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, 1)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Locations["vehicle"].label)
        EndTextCommandSetBlipName(blip)
    end
end)

function TakeOutVehicle(vehicleInfo)
    local coords = Config.Locations["vehicle"].coords
    QBCore.Functions.SpawnVehicle(vehicleInfo, function(veh)
        SetVehicleNumberPlateText(veh, "WZNW"..tostring(math.random(1000, 9999)))
        SetEntityHeading(veh, coords.w)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
        SetVehicleLivery(veh, 2)
        CurrentPlate = QBCore.Functions.GetPlate(veh)
    end, coords, true)
end

function MenuGarage()
    local vehicleMenu = {
        {
            header = "Weazel News Vehicles",
            isMenuHeader = true
        }
    }

    local Vehicles = Config.Vehicles[QBCore.Functions.GetPlayerData().job.grade.level]
    for veh, label in pairs(Vehicles) do
        vehicleMenu[#vehicleMenu+1] = {
            header = label,
            txt = "",
            params = {
                event = "qb-newsjob:client:TakeOutVehicle",
                args = {
                    vehicle = veh
                }
            }
        }
    end
    vehicleMenu[#vehicleMenu+1] = {
        header = "⬅ Close Menu",
        txt = "",
        params = {
            event = "qb-menu:client:closeMenu"
        }

    }
    exports['qb-menu']:openMenu(vehicleMenu)
end

function TakeOutHelicopters(vehicleInfo)
    local coords = Config.Locations["heli"].coords
    QBCore.Functions.SpawnVehicle(vehicleInfo, function(veh)
        SetVehicleNumberPlateText(veh, "WZNW"..tostring(math.random(1000, 9999)))
        SetEntityHeading(veh, coords.w)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
        SetVehicleLivery(veh, 2)
        CurrentPlate = QBCore.Functions.GetPlate(veh)
    end, coords, true)
end

function MenuHeliGarage()
    local vehicleMenu = {
        {
            header = "Weazel News Helicopters",
            isMenuHeader = true
        }
    }

    local Helicopters = Config.Helicopters[QBCore.Functions.GetPlayerData().job.grade.level]
    for veh, label in pairs(Helicopters) do
        vehicleMenu[#vehicleMenu+1] = {
            header = label,
            txt = "",
            params = {
                event = "qb-newsjob:client:TakeOutHelicopters",
                args = {
                    vehicle = veh
                }
            }
        }
    end
    vehicleMenu[#vehicleMenu+1] = {
        header = "⬅ Close Menu",
        txt = "",
        params = {
            event = "qb-menu:client:closeMenu"
        }

    }
    exports['qb-menu']:openMenu(vehicleMenu)
end



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3)
        if LocalPlayer.state.isLoggedIn then
            local inRange = false
            local pos = GetEntityCoords(PlayerPedId())
            if PlayerJob.name == "reporter" then
                if #(pos - vector3(Config.Locations["vehicle"].coords.x, Config.Locations["vehicle"].coords.y, Config.Locations["vehicle"].coords.z)) < 10.0 then
                    inRange = true
                    DrawMarker(2, Config.Locations["vehicle"].coords.x, Config.Locations["vehicle"].coords.y, Config.Locations["vehicle"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if #(pos - vector3(Config.Locations["vehicle"].coords.x, Config.Locations["vehicle"].coords.y, Config.Locations["vehicle"].coords.z)) < 1.5 then
                        if IsPedInAnyVehicle(PlayerPedId(), false) then
                            DrawText3D(Config.Locations["vehicle"].coords.x, Config.Locations["vehicle"].coords.y, Config.Locations["vehicle"].coords.z, "~g~E~w~ - Store the Vehicle")
                        else
                            DrawText3D(Config.Locations["vehicle"].coords.x, Config.Locations["vehicle"].coords.y, Config.Locations["vehicle"].coords.z, "~g~E~w~ - Vehicles")
                        end
                        if IsControlJustReleased(0, 38) then
                            if IsPedInAnyVehicle(PlayerPedId(), false) then
                                DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                            else
                                MenuGarage()
                                currentGarage = k
                            end
                        end
                    end
                elseif  #(pos - vector3(Config.Locations["heli"].coords.x, Config.Locations["heli"].coords.y, Config.Locations["heli"].coords.z)) < 5.0 then
                    inRange = true
                    DrawMarker(2, Config.Locations["heli"].coords.x, Config.Locations["heli"].coords.y, Config.Locations["heli"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if #(pos - vector3(Config.Locations["heli"].coords.x, Config.Locations["heli"].coords.y, Config.Locations["heli"].coords.z)) < 1.5 then
                        if IsPedInAnyVehicle(PlayerPedId(), false) then
                            DrawText3D(Config.Locations["heli"].coords.x, Config.Locations["heli"].coords.y, Config.Locations["heli"].coords.z, "~g~E~w~ - Store the Helicopters")
                        else
                            DrawText3D(Config.Locations["heli"].coords.x, Config.Locations["heli"].coords.y, Config.Locations["heli"].coords.z, "~g~E~w~ - Helicopters")
                        end
                        if IsControlJustReleased(0, 38) then
                            if IsPedInAnyVehicle(PlayerPedId(), false) then
                                DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                            else
                                MenuHeliGarage()
                                currentGarage = k
                            end
                        end
                    end
                end
                if not inRange then
                    Citizen.Wait(2500)
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local inRange = false
        if LocalPlayer.state.isLoggedIn then
            local pos = GetEntityCoords(PlayerPedId())
            if #(pos - vector3(Config.Locations["main"].coords.x, Config.Locations["main"].coords.y, Config.Locations["main"].coords.z)) < 1.5 or #(pos - vector3(Config.Locations["inside"].coords.x, Config.Locations["inside"].coords.y, Config.Locations["inside"].coords.z)) < 1.5 then
                inRange = true
                if #(pos - vector3(Config.Locations["main"].coords.x, Config.Locations["main"].coords.y, Config.Locations["main"].coords.z)) < 1.5 then
                    DrawText3D(Config.Locations["main"].coords.x, Config.Locations["main"].coords.y, Config.Locations["main"].coords.z, "~g~E~w~ - Enter")
                    if IsControlJustReleased(0, 38) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        SetEntityCoords(PlayerPedId(), Config.Locations["inside"].coords.x, Config.Locations["inside"].coords.y, Config.Locations["inside"].coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), Config.Locations["inside"].coords.w)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                elseif #(pos - vector3(Config.Locations["inside"].coords.x, Config.Locations["inside"].coords.y, Config.Locations["inside"].coords.z)) < 1.5 then
                    DrawText3D(Config.Locations["inside"].coords.x, Config.Locations["inside"].coords.y, Config.Locations["inside"].coords.z, "~g~E~w~ - Go outside")
                    if IsControlJustReleased(0, 38) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        SetEntityCoords(PlayerPedId(), Config.Locations["outside"].coords.x, Config.Locations["outside"].coords.y, Config.Locations["outside"].coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), Config.Locations["outside"].coords.w)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end
        end
        if not inRange then
            Citizen.Wait(2500)
        end
    end
end)

RegisterNetEvent('qb-newsjob:client:TakeOutVehicle', function(data)
    local vehicle = data.vehicle
    TakeOutVehicle(vehicle)
end)

RegisterNetEvent('qb-newsjob:client:TakeOutHelicopters', function(data)
    local vehicle = data.vehicle
    TakeOutHelicopters(vehicle)
end)


