Config = {}

-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
webhookrr = "" -- WebHook para quem solicitou rr
webhookanuncio = "" -- WebHook para ver anuncios

-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSAO
-----------------------------------------------------------------------------------------------------------------------------------------
Config.PermRR = "admin.permissao" -- Permissao para dar /rr 
Config.PermAnuncio = "admin.permissao" -- Permissao para dar /anuncio

-----------------------------------------------------------------------------------------------------------------------------------------
-- NOTIFY
-----------------------------------------------------------------------------------------------------------------------------------------
Config.NotifyRR = "Nossa Equipe esteve trabalhando em <b>correções e atualizações</b>. Foi agendado o reinicio do servidor daqui a <b>" -- Notify RR
Config.NotifyRRConti = "</b> desloguem para evitar perdas." -- Notify RR
Config.NotifyKick = "Voce foi kickado nossa equipe esteve trabalhando em atualizaçoes." -- Notify Kick RR

-----------------------------------------------------------------------------------------------------------------------------------------
-- COMMANDOS
-----------------------------------------------------------------------------------------------------------------------------------------
-- /rr tempo -- COMANDO PARA DAR RR
-- /anuncio -- COMANDO PARA DAR ANUNCIO GERAL
-- /notify -- COMANDO PARA TESTE DE NOTIFY
Config.NotifyTeste = true -- Caso esteje false niguem poderar dar /notify para teste de notify
Config.NotifyErr = "Você não tem permissao para dar esse comando" -- Notify de erro do config acima
