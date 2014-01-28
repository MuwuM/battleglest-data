function team(faction)
	local result = 0
	if faction == 0 then
		result = 1
	elseif faction == 1 then
		result = 1
	elseif faction == 2 then
		result = 1
	elseif faction == 3 then
		result = 3
	elseif faction == 4 then
		result = 2
	elseif faction == 5 then
		result = 2
	elseif faction == 6 then
		result = 2
	end
	return result
end

function oppteam(faction)
	local result = 0
	if faction == 0 then
		result = 2
	elseif faction == 1 then
		result = 2
	elseif faction == 2 then
		result = 2
	elseif faction == 3 then
		result = 3
	elseif faction == 4 then
		result = 1
	elseif faction == 5 then
		result = 1
	elseif faction == 6 then
		result = 1
	end
	return result
end


function teamfaction(faction)
	local result = 0
	if faction == 0 then
		result = 0
	elseif faction == 1 then
		result = 0
	elseif faction == 2 then
		result = 0
	elseif faction == 3 then
		result = 3
	elseif faction == 4 then
		result = 4
	elseif faction == 5 then
		result = 4
	elseif faction == 6 then
		result = 4
	end
	return result
end
function oppteamfaction(faction)
	local result = 0
	if faction == 0 then
		result = 4
	elseif faction == 1 then
		result = 4
	elseif faction == 2 then
		result = 4
	elseif faction == 3 then
		result = 3
	elseif faction == 4 then
		result = 0
	elseif faction == 5 then
		result = 0
	elseif faction == 6 then
		result = 0
	end
	return result
end

function isAI(faction)
	--print(getPlayerName(faction))
	local result = 0
	--addConsoleLangText('test',getPlayerName(faction),string.upper(string.sub(getPlayerName(faction), 2, 4)))
	if string.upper(string.sub(getPlayerName(faction), 1, 3)) == 'CPU' then
		result = 1
	elseif string.upper(string.sub(getPlayerName(faction), 1, 4)) == '*AI*' then
		result = 1
	elseif string.upper(string.sub(getPlayerName(faction), 1, 3)) == '???' then
		result = 2
	elseif string.upper(string.sub(getPlayerName(faction), 2, 4)) == '???' then
		result = 2
	elseif string.upper(string.sub(getPlayerName(faction), 1, 7)) == 'NETWORK' or string.upper(string.sub(getPlayerName(faction), 1, 8)) == 'NETZWERK' then
		result = 3
	end
	return result
end

function modulo(x,y)
	return x - (math.floor(x/y)*y)
end

function clearname(name)
	name = string.gsub(name, "_", " ")
	name = string.gsub(name, "^%s*(.-)%s*$", "%1").." "
    words = {}
    for w in string.gfind(name, "%a+%s") do
      table.insert(words, w)
    end
	name=""
	for k,s in  pairs(words) do
      name = name..string.upper(string.sub(s, 1, 1))..string.lower(string.sub(s, 2, -1))
    end
	name = string.gsub(name, "^%s*(.-)%s*$", "%1")
	return name
end

function displayStatus()
	kills1text = kills[1]
	kills2text = kills[2]
	towers1text = towersalive[1]
	towers2text = towersalive[2]
	if kills[1] < 10 then
		kills1text = "  "..kills1text
	end
	if kills[2] < 10 then
		kills2text = "  "..kills2text
	end
	if towersalive[1] < 10 then
		towers1text = "  "..towers1text
	end
	if towersalive[2] < 10 then
		towers2text = "  "..towers2text
	end
	displayFormattedText("   %s                          %s\n   %s                          %s",kills1text,kills2text,towers1text,towers2text)
	
end
function getVersion()
	local f = assert(io.open(getSystemMacroValue("$SCENARIO_PATH").."../../version.txt", "r"))
    local t = f:read("*line")
	f:close()
	f = assert(io.open(getSystemMacroValue("$SCENARIO_PATH").."../../subversion.txt", "r"))
    t = t.."-"..f:read("*line")
    f:close()
	return t
end
function networkaddUnitToGroupSelection(faction,unit,group)
	if humanFaction() == faction then
		addUnitToGroupSelection(unit,group)
	end
end
function networkselectUnit(faction,unit)
	if humanFaction() == faction then
		selectUnit(unit)
	end
end
