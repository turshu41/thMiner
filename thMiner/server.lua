local QBCore = exports['qb-core']:GetCoreObject()

-- Taş kazma

RegisterNetEvent("taskaz")
AddEventHandler("taskaz", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = math.random(Config.tasmin,Config.tasmax)
    xPlayer.Functions.AddItem("tas", item)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = item..' Tane Taş Topladın!', length = 2500})
end)

-- Taş yıkama

RegisterNetEvent("tasyika")
AddEventHandler("tasyika", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.AddItem("yikanmistas", Config.TasYikamaMiktar)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Taşları Yıkadın!', length = 2500})
end)

QBCore.Functions.CreateCallback("taskontrol", function(source, cb)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if xPlayer.Functions.RemoveItem("tas", Config.TasYikamaMiktar) then
        cb(true)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Yeterince Taşın Yok!', length = 2500})
    end
end)

-- Taş eritme

QBCore.Functions.CreateCallback("eritmekontrol", function(source, cb)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if xPlayer.Functions.RemoveItem("yikanmistas", Config.TasEritmeMiktar) then
        cb(true)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Yeterince Yıkanmış Taşın Yok!', length = 2500})
    end
end)

RegisterNetEvent("taserit")
AddEventHandler("taserit", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local item = math.random(1,100) -- dont change / değiştirme
    local DiamondRatio = math.random(Config.MeltedDiamondRatioMin,Config.MeltedDiamondRatioMax)
    local GoldRatio = math.random(Config.MeltedGoldRatioMin,Config.MeltedGoldRatioMax)
    local CopperRatio = math.random(Config.MeltedCopperRatioMin,Config.MeltedCopperRatioMax)
    local IronRatio = math.random(Config.MeltedIronRatioMin,Config.MeltedIronRatioMax)
    if item >= Config.DiamondRatioMin and item <= Config.DiamondRatioMax then
        xPlayer.Functions.AddItem("elmas", DiamondRatio)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Taşları Erittin Ve '..DiamondRatio..' Tane Elmas Buldun!', length = 2500})
    elseif item >= Config.GoldRatioMin and item <= Config.GoldRatioMax then
        xPlayer.Functions.AddItem("altin", GoldRatio)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Taşları Erittin Ve '..GoldRatio..' Tane Altın Buldun!', length = 2500})
    elseif item >= Config.CopperRatioMin and item <= Config.CopperRatioMax then
        xPlayer.Functions.AddItem("bakir", CopperRatio)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Taşları Erittin Ve '..CopperRatio..' Tane Bakır Buldun!', length = 2500})
    elseif item >= Config.IronRatioMin and item <= Config.IronRatioMax then
        xPlayer.Functions.AddItem("demir", IronRatio)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Taşları Erittin Ve '..IronRatio..' Tane Demir Buldun!', length = 2500})
    end
end)

-- maden sat

local elmas = false
local altin = false
local bakir = false
local demir = false

QBCore.Functions.CreateCallback("madenkontrol", function(source, cb)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if xPlayer.Functions.GetItemByName("elmas") then
        cb(true)
        elmas = true
    elseif xPlayer.Functions.GetItemByName("altin") then
        cb(true)
        altin = true
    elseif xPlayer.Functions.GetItemByName("bakir") then
        cb(true)
        bakir = true
    elseif xPlayer.Functions.GetItemByName("demir") then
        cb(true)
        demir = true
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Yeterince Madenin Yok!   ', length = 2500})
    end
end)

RegisterNetEvent("madensat")
AddEventHandler("madensat", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if elmas then
        local ElmasAmount = xPlayer.Functions.GetItemByName("elmas").amount
        xPlayer.Functions.RemoveItem("elmas",ElmasAmount)
        xPlayer.Functions.AddMoney(Config.bankorcash, Config.DiamondSellPrice*ElmasAmount)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = ElmasAmount..' Tane Elmas Sattın Ve $'..Config.DiamondSellPrice*ElmasAmount..' Aldın', length = 2500})
        elmas = false
    elseif altin then
        local AltinAmount = xPlayer.Functions.GetItemByName("altin").amount
        xPlayer.Functions.RemoveItem("altin",AltinAmount)
        xPlayer.Functions.AddMoney(Config.bankorcash, Config.GoldSellPrice*AltinAmount)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = AltinAmount..' Tane Altın Sattın Ve $'..Config.GoldSellPrice*AltinAmount..' Aldın', length = 2500})
        altin = false
    elseif bakir then
        local BakirAmount = xPlayer.Functions.GetItemByName("bakir").amount
        xPlayer.Functions.RemoveItem("bakir",BakirAmount)
        xPlayer.Functions.AddMoney(Config.bankorcash, Config.CopperSellPrice*BakirAmount)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = BakirAmount..' Tane Bakır Sattın Ve $'..Config.CopperSellPrice*BakirAmount..' Aldın', length = 2500})
        bakir = false
    elseif demir then
        local DemirAmount = xPlayer.Functions.GetItemByName("demir").amount
        xPlayer.Functions.RemoveItem("demir",DemirAmount)
        xPlayer.Functions.AddMoney(Config.bankorcash, Config.IronSellPrice*DemirAmount)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = DemirAmount..' Tane Demir Sattın Ve $'..Config.IronSellPrice*DemirAmount..' Aldın', length = 2500})
        demir = false
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Yeterince Madenin Yok!', length = 2500})
    end
end)