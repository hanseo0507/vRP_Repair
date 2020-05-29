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