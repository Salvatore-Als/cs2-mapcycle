local kv = LoadKeyValues("cfg/vscripts/mapcycle.ini")
local nextMap = nil

function init()
	local currentMap = GetMapName()

	if currentMap == nil then
		print("say [MAPCYCLE] Couldn't get the actual mapname")
	end

	if kv == nil then
		print("say [MAPCYCLE] Couldn't load config file cfg/vscripts/mapcycle.ini")
		return
	end
	
	cycle = kv["cycle"]

	if cycle == nil then
		print("say [MAPCYCLE] Couldn't load cycle configuration in file cfg/vscripts/mapcycle.ini")
		return
	end

	local foundMap = false
	local firstMap = nil
	local lastMap = nil

	for map in string.gmatch(cycle, "[^%s]+") do
		if firstMap == nil then
			firstMap = map
		end

		lastMap = map

		if foundMap then
			nextMap = map
			SendToServerConsole("nextlevel " .. nextMap)
			break
		end

		if map == currentMap then
			foundMap = true
		end
	end

	if nextMap == nil and currentMap == lastMap then
		nextMap = firstMap
    	SendToServerConsole("nextlevel " .. nextMap)
	end
end

init()