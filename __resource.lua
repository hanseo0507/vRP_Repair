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

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'vRP_Repair'

version '1.0.0'

dependency "vrp"


server_scripts {
	"@vrp/lib/utils.lua",
	'server.lua'
}

client_scripts {
	'client.lua'
}