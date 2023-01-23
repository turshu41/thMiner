local QBCore = exports['qb-core']:GetCoreObject()
local availableActions = {}

-- Taş Kazma

Citizen.CreateThread(function()
    local sleep = 1000
    while true do
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
            for i=1, #Config.Locations do
                local coords = Config.Locations[i]["cashier"]
                local distance = GetDistanceBetweenCoords(playercoords, coords.x, coords.y, coords.z, true)
                local distance2 = GetDistanceBetweenCoords(playercoords, 2956.64, 2789.38, 41.2, true)
                if distance2 < 50 then
                    sleep = 0
                    DrawMarker(Config.MarkerTipi, coords["x"], coords["y"], coords["z"] ,0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.MarkerBoyu, Config.MarkerBoyu, Config.MarkerBoyu, 255, 255, 0, 50, false, true, 2, nil, nil, false)
                    if distance < 2 then
                            DrawText3D(coords["x"], coords["y"], coords["z"], '[E] Taş Kaz')
                        if IsControlJustReleased(0, 38) then
                            exports['mythic_progbar']:Progress({
                                name = "taskaz",
                                duration = 5000,
                                label = "Taş kazıyorsun",
                                useWhileDead = false,
                                canCancel = true,
                                controlDisables = {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                },
                                animation = {
                                    animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
                                    anim = "idle_c",
                                    flags = 49,
                                },
                            }, function(status)
                                if not status then
                                    TriggerServerEvent("taskaz")
                                end
                            end)
                        end
                    end
                else
                    sleep = 1000
                end
            end
        Wait(sleep)
    end
end)

-- Taş Yıkama

Citizen.CreateThread(function()
    local inRange = false
    local NPC = Config.NPC
    local sleep = 2000
    while true do
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, NPC.x, NPC.y, NPC.z, true)
        if distance < 4 then
            sleep = 0
            if Config.UseTextUI == true then
                if not inRange then
                    exports['aty_textui']:Enter('E', 'Bas', 'Taşları Yıka!', "blue")
                    inRange = true
                end
            else
                DrawText3D(NPC.x,NPC.y,NPC.z, '[E] Taşlarını Yıka')
            end
            if IsControlJustReleased(0, 38) then
                QBCore.Functions.TriggerCallback('taskontrol', function(cb)
                    if cb == true then
                        exports['mythic_progbar']:Progress({
                            name = "TasYika",
                            duration = 5000,
                            label = "Taşlarını Yıkıyorsun",
                            useWhileDead = false,
                            canCancel = true,
                            controlDisables = {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            },
                            animation = {
                                animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
                                anim = "idle_c",
                                flags = 49,
                            },
                        }, function(status)
                                if not status then
                                TriggerServerEvent("tasyika")
                                end
                        end)
                    end
                end)
            end
        elseif inRange then
            sleep = 1000
            inRange = false
            exports['aty_textui']:Exit()
        end
        Citizen.Wait(sleep)
    end
end)

-- Taş erit

Citizen.CreateThread(function()
    local inRange = false
    local sleep = 2000
    while true do
        Wait(sleep)
        local EritmeCoord = Config.EritmeCoord
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, EritmeCoord.x, EritmeCoord.y, EritmeCoord.z, true)
        if distance < 20 then
            sleep = 0
            DrawMarker(Config.MarkerTipi,EritmeCoord.x, EritmeCoord.y, EritmeCoord.z,0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.MarkerBoyu, Config.MarkerBoyu, Config.MarkerBoyu, 255, 255, 0, 50, false, true, 2, nil, nil, false)
            if distance < 4 then
                if IsControlJustReleased(0, 38) then 
                    QBCore.Functions.TriggerCallback('eritmekontrol', function(cb)
                        exports['mythic_progbar']:Progress({
                            name = "TasErit",
                            duration = 5000,
                            label = "Yıkanmış Taşları Eritiyorsun!",
                            useWhileDead = false,
                            canCancel = true,
                            controlDisables = {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            },
                            animation = {
                                animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
                                anim = "idle_c",
                                flags = 49,
                            },
                        }, function(status)
                            if not status then
                                TriggerServerEvent("taserit")
                            end
                        end)
                    end)
                end
                if Config.UseTextUI == true then
                    if not inRange then
                        inRange = true
                        if Config.TextUI == "aty_textui" then
                            exports['aty_textui']:Enter('E', 'Bas', 'Yıkanmış Taşları Erit!', "blue")
                        elseif Config.TextUI == "okokTextUI" then
                            exports['okokTextUI']:Open('[E] Yıkanmış Taşları Erit!', 'darkblue', 'right')
                        end
                    end
                else
                DrawText3D(EritmeCoord.x,EritmeCoord.y,EritmeCoord.z, '[E] Yıkanmış Taşlarını Erit!')
                end
            elseif inRange then
                sleep = 1000
                inRange = false
                if Config.TextUI == "aty_textui" then
                    exports['aty_textui']:Exit()
                elseif Config.TextUI =="okokTextUI" then
                    exports['okokTextUI']:Close()
                else
                end
            end
        end
    end
end)

-- Maden Sat

Citizen.CreateThread(function()
    local inRange = false
    local sleep = 1000
    while true do
        Wait(sleep)
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, Config.SellNPC.x, Config.SellNPC.y, Config.SellNPC.z, true)
        if distance < 2 then
            sleep = 0
            if IsControlJustReleased(0, 38) then
                QBCore.Functions.TriggerCallback('madenkontrol', function(cb)
                    exports['mythic_progbar']:Progress({
                        name = "madensat",
                        duration = 5000,
                        label = "Madenlerini Satıyorsun!",
                        useWhileDead = false,
                        canCancel = true,
                        controlDisables = {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        },
                        animation = {
                            animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
                            anim = "idle_c",
                            flags = 49,
                        },
                    }, function(status)
                            if not status then
                            TriggerServerEvent("madensat")
                            end
                        end)
                end)
            end
            if Config.UseTextUI == true then
                if not inRange then
                    inRange = true
                    if Config.TextUI == "aty_textui" then
                        exports['aty_textui']:Enter('E', 'Bas', 'Madenlerini Sat!', "blue")
                    elseif Config.TextUI == "okokTextUI" then
                        exports['okokTextUI']:Open('[E] Madenlerini Sat!', 'darkblue', 'right')
                    end
                end
            else
                DrawText3D(Config.SellNPC.x,Config.SellNPC.y,Config.SellNPC.z, '[E] Madenlerini Sat!')
            end
        elseif inRange then
            Sleep = 1000
            inRange = false
            if Config.TextUI == "aty_textui" then
                exports['aty_textui']:Exit()
            elseif Config.TextUI =="okokTextUI" then
                exports['okokTextUI']:Close()
            else
            end
        end
    end
end)

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end

-- NPC

local NPC = Config.NPC
Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_m_autoshop_01"))
    npc = CreatePed(1, GetHashKey("s_m_m_autoshop_01"), NPC.x, NPC.y, NPC.z -1, false, true) -- Yıkama NPC ped kodu ve kordinatı
    SetEntityHeading(npc, NPC.w)
    SetPedCombatAttributes(npc, 46, true)              
    SetPedFleeAttributes(npc, 0, 0)              
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetEntityAsMissionEntity(npc, true, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
end)

local NPC2 = Config.SellNPC
Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_m_autoshop_01"))
    npc = CreatePed(1, GetHashKey("s_m_m_autoshop_01"), NPC2.x, NPC2.y, NPC2.z -1, false, true) -- Satış NPC ped kodu ve kordinatı
    SetEntityHeading(npc, NPC2.w)
    SetPedCombatAttributes(npc, 46, true)              
    SetPedFleeAttributes(npc, 0, 0)              
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetEntityAsMissionEntity(npc, true, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
end)

--blips

if Config.BlipAc then
    CreateThread(function()
        local blip = AddBlipForCoord(2956.64, 2789.38, 41.2)
        SetBlipSprite(blip, 1)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 5)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.MineName)
        EndTextCommandSetBlipName(blip)
    end)
    CreateThread(function()
        local blip = AddBlipForCoord(Config.EritmeCoord.x, Config.EritmeCoord.y, Config.EritmeCoord.z)
        SetBlipSprite(blip, 1)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 5)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.MeltName)
        EndTextCommandSetBlipName(blip)
    end)
    CreateThread(function()
        local blip = AddBlipForCoord(Config.SellNPC.x, Config.SellNPC.y, Config.SellNPC.z)
        SetBlipSprite(blip, 1)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 5)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.SellNPCName)
        EndTextCommandSetBlipName(blip)
    end)
    CreateThread(function()
        local blip = AddBlipForCoord(Config.NPC.x, Config.NPC.y, Config.NPC.z)
        SetBlipSprite(blip, 1)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 5)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.WashName)
        EndTextCommandSetBlipName(blip)
    end)
end