QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("ds-openwebsite:client:openui", function()
    local popup = Config.UsePopup
    SetNuiFocus(true, true)
        SendNUIMessage({
            openWebsite = true,
            popup = popup,
            websiteUrl = Config.URL
        })
end)

RegisterNUICallback('escape', function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({
        openWebsite = false,
    });
    cb(true)
end)

local model = Config.PedModel

RequestModel(model)
while not HasModelLoaded(model) do
    Wait(0)
end

local function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

local entity = CreatePed(0, model, Config.PedLocation, true, false)

FreezeEntityPosition(entity, true)
SetBlockingOfNonTemporaryEvents(entity, true)
SetPedArmour(entity, 1000000)
SetEntityHealth(entity, 1000000)

loadAnimDict("amb@world_human_cop_idles@male@idle_b")
TaskPlayAnim(entity, "amb@world_human_cop_idles@male@idle_b", "idle_e", 8.0, 1.0, -1, 17, 0, 0, 0, 0)

exports['qb-target']:AddTargetEntity(entity, {
    options = {
        {
            type = "client",
            event = "ds-openwebsite:client:openui",
            icon = Config.Info.icon,
            label = Config.Info.label,
        },
    },
    distance = 2.0
})