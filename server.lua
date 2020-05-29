--[[
	# vRP_Repair
	🔧 FiveM vRP Repair Script / 파이브엠 차량 수리 스크립트
	
	## 한국어 
	원본 파일 : [https://github.com/Nikuez95/nk_repair](https://github.com/Nikuez95/nk_repair)
	해당 스크립트를 사용하기위해서는 **ProgressBars** 스크립트가 필요합니다
	[https://forum.cfx.re/t/release-progress-bars-1-0-standalone/526287](https://forum.cfx.re/t/release-progress-bars-1-0-standalone/526287)
	제작자 : [Nikue95](https://github.com/Nikuez95)
	컨버터 : [HanSeo](https://github.com/HanSeo0507)
	## English
	Original : [https://github.com/Nikuez95/nk_repair](https://github.com/Nikuez95/nk_repair)
	**ProgressBars** script is required to use that script
	[https://forum.cfx.re/t/release-progress-bars-1-0-standalone/526287](https://forum.cfx.re/t/release-progress-bars-1-0-standalone/526287)
	Author : [Nikue95](https://github.com/Nikuez95)
	Modified : [HanSeo](https://github.com/HanSeo0507)
]]--

local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","nk_repair")

Citizen.CreateThread(function()
	for k,v in pairs(mochilas) do
	 	vRP.defInventoryItem({k,v.name,v.desc,v.choices,v.weight})
	end
end)

mochilas = {
	["fixtool"] = {
		name = "Toolbox",
		desc = "Use Toolbox to repair your vehicle",
		choices = function(args)
			local menu = {}
			menu["Use"] = {function(player,choice)
		 		local user_id = vRP.getUserId({player})
		  		if vRP.getInventoryItemAmount({user_id, "fixtool"}) >= 1 then
					TriggerClientEvent('nk_repair:MenuRipara', player)
		  		else
					vRPclient.notify(player,{"You don't have a ~b~Toolbox~s~!"})
		  		end
			end}
	  		return menu
		end,
		weight = 0
	}
}

RegisterServerEvent('nk_repair:RemoveItem')
AddEventHandler('nk_repair:RemoveItem', function(ped, coords, veh)
	local user_id = vRP.getUserId({source})
	if vRP.tryGetInventoryItem({user_id, "fixtool", 1, false}) then
		TriggerClientEvent('nk_repair:MettiCrick', source, ped, coords, veh)
	else
		vRPclient.notify(source,{"You don't have a ~b~Toolbox~s~!"})
	end
end)

RegisterServerEvent('nk_repair:fixCar')
AddEventHandler('nk_repair:fixCar', function()
	vRPclient.fixeNearestVehicle(source,{7})
end)
