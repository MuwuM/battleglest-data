--fog-of-war value="explored"
--disable AI
print("----------------- BattleGlest v. "..getVersion().." -----------------")
addConsoleLangText("startup", getVersion())

if string.gsub(_VERSION, "Lua ", "") < "5.1" then
	addConsoleLangText("LuaUpdateNeeded",_Version,"Lua 5.1")
end
--print("-------------");
local i = 0
while i < 7 do
	disableAi(i)
	disableConsume(i)
	i = i + 1
end

dofile(getSystemMacroValue("$SCENARIO_PATH").."hero_selector.lua")
--dofile(getSystemMacroValue("$SCENARIO_PATH").."load_lanes.lua")

unit:create("view", 0, hersosel)
unit:create("view", 4, hersosel)


giveResource("gold", 1, 400)
giveResource("gold", 2, 400)
giveResource("gold", 5, 400)
giveResource("gold", 6, 400)



