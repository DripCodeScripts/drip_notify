local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
-- WebHook
-----------------------------------------------------------------------------------------------------------------------------------------
local DripNotifyRR = webhookrr
local DripNotifyAnuncio = webhookanuncio

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- LIBERAR SCRIPT
-----------------------------------------------------------------------------------------------------------------------------------------
PerformHttpRequest('http://api.ipify.org/', function(errorCode, resultData, resultHeaders)
	---- Liberar Drip ----
	local DripRealToken = "q7aDC42GjOC0ymLsQHTP7T5DhXrltg8a"
	---- Cliente Drip ----
	local DripClientToken = Config.DripToken
	print('DripCode - Checando TOKEN')
	Wait(500)
	if DripRealToken == DripClientToken  then 
		print('DripCode - Token Autenticado')
		Wait(500)
		print('DripCode - Script Carregado')
	else
		print('DripCode - Token Não Autenticado')
		print('DripCode - Desligando Servidor')
        Wait(5000)
        os.exit()
	end
end)

RegisterCommand('rr',function(source,args)
	local source = source
	local users = vRP.getUsers()
	local user_id = vRP.getUserId(source)
	local nplayer = vRP.getUserSource(users)
    local perm = Config.PermCommands
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,Config.PermRR) then
        if args[1] then
            TriggerClientEvent("Notify",-1,"rr",""..Config.NotifyRR.." "..args[1].." "..Config.NotifyRRConti..".")
            SendWebhookMessage(DripNotifyRR,"```[ID]: "..user_id.." \n[SOLICITOU]: RR DO SERVIDOR \n[SET]: "..perm..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
            Wait(600000)
             local users = vRP.getUsers()
                for k,v in pairs(users) do
                local id = vRP.getUserSource(parseInt(k))
                if id then
                    vRP.kick(id,""..Config.NotifyKick..".")
                    vRP.kick(source,""..Config.NotifyKick..".")
                    os.exit()
                end
            end
        end
    end
end)

RegisterCommand('anuncio',function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    local perm = Config.PermAnuncio
    if vRP.hasPermission(user_id,Config.PermAnuncio) then
        local mensagem = vRP.prompt(source,"Mensagem:","")
        if mensagem then
        TriggerClientEvent("Notify",-1,"anuncio","O Administrador "..identity.name.." quer informar voces de que -» <b>"..mensagem.."</b>. ")
        SendWebhookMessage(DripNotifyAnuncio,"```[ID]: "..user_id.. "\n[NOME]: "..identity.name.." \n[ENVIOU ANUNCIO]: "..mensagem.."\n[SET]: "..perm..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        end
    end
end)