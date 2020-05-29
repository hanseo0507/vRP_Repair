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

function ObjectInFront(ped, pos)
	local entityWorld = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.5, 0.0)
	local car = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 30, ped, 0)
	local _, _, _, _, result = GetRaycastResult(car)
	return result
end

function GetVehicleInDirection( coordFrom, coordTo )
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed( -1 ), 0 )
    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
    return vehicle
end

function HanSeo_Notify(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(true, false)
end

RegisterNetEvent('nk_repair:MettiCrick')
AddEventHandler('nk_repair:MettiCrick', function(ped, coords, veh)
	local dict
	local model = 'prop_carjack'
	local offset = GetOffsetFromEntityInWorldCoords(ped, 0.0, -2.0, 0.0)
	local headin = GetEntityHeading(ped)
	local vehicle = GetVehicleInDirection(coords, GetOffsetFromEntityInWorldCoords(coords, 0.0, 5.0, 0.0))
	FreezeEntityPosition(veh, true)
	local vehpos = GetEntityCoords(veh)
	dict = 'mp_car_bomb'
	RequestAnimDict(dict)
	RequestModel(model)
	while not HasAnimDictLoaded(dict) or not HasModelLoaded(model) do
		Citizen.Wait(1)
	end
	local vehjack = CreateObject(GetHashKey(model), vehpos.x, vehpos.y, vehpos.z - 0.5, true, true, true)
	exports['progressBars']:startUI(9250, "PLACING THE JACK")
	AttachEntityToEntity(vehjack, veh, 0, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1250, 1, 0.0, 1, 1)
	Citizen.Wait(1250)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.01, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.025, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.05, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.1, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.15, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.2, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.3, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	dict = 'move_crawl'
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.4, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.5, true, true, true)
	SetEntityCollision(veh, false, false)
	TaskPedSlideToCoord(ped, offset, headin, 1000)
	Citizen.Wait(1000)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
	exports['progressBars']:startUI(11000, "REPAIRING A VEHICLE")
	TaskPlayAnimAdvanced(ped, dict, 'onback_bwd', coords, 0.0, 0.0, headin - 180, 1.0, 0.5, 3000, 1, 0.0, 1, 1)
	dict = 'amb@world_human_vehicle_mechanic@male@base'
	Citizen.Wait(3000)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(1)
	end
	TaskPlayAnim(ped, dict, 'base', 8.0, -8.0, 5000, 1, 0, false, false, false)
	dict = 'move_crawl'
	Citizen.Wait(5000)
	local coords2 = GetEntityCoords(ped)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(1)
	end
	TaskPlayAnimAdvanced(ped, dict, 'onback_fwd', coords2, 0.0, 0.0, headin - 180, 1.0, 0.5, 2000, 1, 0.0, 1, 1)
	Citizen.Wait(3000)
	dict = 'mp_car_bomb'
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(1)
	end
	TriggerServerEvent('nk_repair:fixCar')
	ClearPedTasksImmediately(playerPed)
	exports['progressBars']:startUI(8250, "REMOVING THE JACK")
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1250, 1, 0.0, 1, 1)
	Citizen.Wait(1250)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.4, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.3, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.2, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.15, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.1, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.05, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.025, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	dict = 'move_crawl'
	Citizen.Wait(1000)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z + 0.01, true, true, true)
	TaskPlayAnimAdvanced(ped, dict, 'car_bomb_mechanic', coords, 0.0, 0.0, headin, 1.0, 0.5, 1000, 1, 0.25, 1, 1)
	SetEntityCoordsNoOffset(veh, vehpos.x, vehpos.y, vehpos.z, true, true, true)
	FreezeEntityPosition(veh, false)
	DeleteObject(vehjack)
	SetEntityCollision(veh, true, true)
end)

RegisterNetEvent('nk_repair:MenuRipara')
AddEventHandler('nk_repair:MenuRipara', function()
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local veh = ObjectInFront(ped, coords)
	if DoesEntityExist(veh) then
		if IsEntityAVehicle(veh) then
			SetEntityAsMissionEntity(veh, true, true)
			TriggerServerEvent('nk_repair:RemoveItem', ped, coords, veh)
		else
			HanSeo_Notify("You must be near a ~y~Vehicle~s~!")
		end
	else
		HanSeo_Notify("You must be near a ~y~Vehicle~s~!")
	end
end)