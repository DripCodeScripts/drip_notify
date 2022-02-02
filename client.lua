RegisterNetEvent("Notify")
AddEventHandler("Notify", function(type, string)
    SendNUIMessage({
        NotifyString = string,
        NotifyType = type
    })
end)


RegisterCommand('notify',function()
	local liberar = Config.NotifyTeste
	if liberar == true then
		TriggerEvent("Notify","sucesso","Você vai ser desconectado em <b>60 segundos</b>.",8000)
		Wait(1000)
		TriggerEvent("Notify","negado","Você vai ser desconectado em <b>60 segundos</b>.",8000)
		Wait(1000)
		TriggerEvent("Notify","aviso","Você vai ser desconectado em <b>60 segundos</b>.",8000)
	else
		TriggerEvent("Notify", "negado", ""..Config.NotifyErr..".")
	end
end)


