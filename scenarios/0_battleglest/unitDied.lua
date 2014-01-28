if lastDeadUnitCauseOfDeath() >= 1  then
	--
	if  units[lastDeadUnit()] == nil then
	elseif units[lastDeadUnit()].isHero == 1 then
	
		local resptemp = respawn_unit:new{}
		resptemp:createHero(units[lastDeadUnit()].name, units[lastDeadUnit()].faction, nil, units[lastDeadUnit()].experience, units[lastDeadUnit()].respawn)
		--addConsoleLangText("killed",lastDeadUnitName (),lastDeadUnit (),lastDeadUnitKillerName(),lastDeadUnitKiller())
		if units[lastDeadUnitKiller()] == nil then
			addConsoleLangText("killed2",clearname(lastDeadUnitName()),"a "..clearname(lastDeadUnitKillerName()))
		elseif units[lastDeadUnitKiller()].isHero == 1  then
			addConsoleLangText("killed2",clearname(lastDeadUnitName()),clearname(lastDeadUnitKillerName()))
		else
			addConsoleLangText("killed2",clearname(lastDeadUnitName()),"a "..clearname(lastDeadUnitKillerName()))
		end
		kills[oppteam(units[lastDeadUnit()].faction)] = kills[oppteam(units[lastDeadUnit()].faction)] + 1
		displayStatus()
		--displayFormattedLangText("score1",kills[1],kills[2],towersalive[1],towersalive[2])
		local i = 0
		while i <= maxUnitID do
			if units[i] == nil then
			elseif units[i].id == units[lastDeadUnit()].id then
			elseif units[i].isAlive == 0 then
			elseif units[i].isHero == 0 then
			elseif team(units[i].faction) == team(units[lastDeadUnit()].faction) then
			else
				local w = units[i]
				if w.id == lastDeadUnitKiller() then
					giveKills(w.id,(150-1))
					giveResource("gold", units[lastDeadUnitKiller()].faction, 250)
				else
					giveKills(w.id,(100))
					giveResource("gold", units[lastDeadUnitKiller()].faction, 150)
				end
			end
			i = i+1
		end
	elseif units[lastDeadUnit()].faction == 3 then
		if units[lastDeadUnit()].name == "bug" then
			if killed_bugs < 4  then
				killed_bugs = killed_bugs + 1
				print ("Killed "..killed_bugs.." bugs.")
			end
			if killed_bugs >= 4  then
				killed_bugs = 0
				local resptemp = respawn_unit:new{}
				resptemp:create(units[lastDeadUnit()].name, units[lastDeadUnit()].faction, { 330 , 180 }, 0,30)
			end
			local i = 0
			while i <= maxUnitID do
				if units[i] == nil then
				elseif units[i].id == units[lastDeadUnit()].id then
				elseif units[i].isAlive == 0 then
				elseif units[i].isHero == 0 then
				elseif team(units[i].faction) == team(units[lastDeadUnit()].faction) then
				else
					local w = units[i]
					if w.id == lastDeadUnitKiller() then
						giveKills(w.id,(25-1))
						giveResource("gold", units[lastDeadUnitKiller()].faction, 50)
					else
						giveKills(w.id,(25))
						giveResource("gold", units[lastDeadUnitKiller()].faction, 5)
					end
				end
				i = i+1
			end
		elseif units[lastDeadUnit()].name == "hydra" then
			local resptemp = respawn_unit:new{}
			resptemp:create(units[lastDeadUnit()].name, units[lastDeadUnit()].faction, { 180 , 330 }, 0,120)
			local i = 0
			while i <= maxUnitID do
				if units[i] == nil then
				elseif units[i].id == units[lastDeadUnit()].id then
				elseif units[i].isAlive == 0 then
				elseif units[i].isHero == 0 then
				elseif team(units[i].faction) == team(units[lastDeadUnit()].faction) then
				else
					local w = units[i]
					if w.id == lastDeadUnitKiller() then
						giveKills(w.id,(125-1))
						giveResource("gold", units[lastDeadUnitKiller()].faction, 120)
					else
						giveKills(w.id,(125))
						giveResource("gold", units[lastDeadUnitKiller()].faction, 50)
					end
				end
				i = i+1
			end
		elseif units[lastDeadUnit()].name == "statue" then
			local resptemp = respawn_unit:new{}
			resptemp:create(units[lastDeadUnit()].name, units[lastDeadUnit()].faction, { 180 , 330 }, 0,240)
			ultracreeps[team(units[lastDeadUnitKiller()].faction)] = ultracreeps[team(units[lastDeadUnitKiller()].faction)] + 3
		elseif units[lastDeadUnit()].name == "tingorn" then
			local resptemp = respawn_unit:new{}
			resptemp:create(units[lastDeadUnit()].name, units[lastDeadUnit()].faction, { 180 , 330 }, 0,240)
			ultracreeps[team(units[lastDeadUnitKiller()].faction)] = ultracreeps[team(units[lastDeadUnitKiller()].faction)] + 3
			local i = 0
			while i <= maxUnitID do
				if units[i] == nil then
				elseif units[i].id == units[lastDeadUnit()].id then
				elseif units[i].isAlive == 0 then
				elseif units[i].isHero == 0 then
				elseif team(units[i].faction) == team(units[lastDeadUnit()].faction) then
				else
					local w = units[i]
					if w.id == lastDeadUnitKiller() then
						giveKills(w.id,(200-1))
						giveResource("gold", units[lastDeadUnitKiller()].faction, 250)
					else
						giveKills(w.id,(100))
						giveResource("gold", units[lastDeadUnitKiller()].faction, 130)
					end
				end
				i = i+1
			end
			
		end
	elseif units[lastDeadUnit()].isCreep == 1 then
		if units[lastDeadUnitKiller()] == nil then else
			if units[lastDeadUnitKiller()].isHero == 1 then
				giveKills(units[lastDeadUnitKiller()].id,(35-1))
				giveResource("gold", units[lastDeadUnitKiller()].faction, 25)
			end
		end
	elseif units[lastDeadUnit()].isTower == 1 then
		if units[lastDeadUnitKiller()] == nil then else
			if units[lastDeadUnitKiller()].isHero == 1 then
				giveKills(units[lastDeadUnitKiller()].id,(155-1))
				giveResource("gold", units[lastDeadUnitKiller()].faction, 50)
			end
			local i = 0
			while i < 7 do
				if team(units[lastDeadUnitKiller()]) == team(i) then
					giveResource("gold", units[lastDeadUnitKiller()].faction, 100)
				end
				i = i + 1
			end
		end
	end
end
if  units[lastDeadUnit()] == nil then else
	if units[lastDeadUnit()].isTower == 1 then
		ultracreeps[oppteam(units[lastDeadUnit()].faction)] = ultracreeps[oppteam(units[lastDeadUnit()].faction)] + 1
		towersalive[team(units[lastDeadUnit()].faction)] = towersalive[team(units[lastDeadUnit()].faction)] - 1
		displayStatus()
	elseif units[lastDeadUnit()].isBase == 1 then
		endofgame = 1
		togglePauseGame(1)
		local i = 0
		while i < 7 do
			if oppteam(units[lastDeadUnit()].faction) == team(i) then
				setPlayerAsWinner(i)
			end
			i = i + 1
		end

		setCameraPosition(units[lastDeadUnit()]:position())

		
		displayFormattedLangText("endofmatch"..oppteam(units[lastDeadUnit()].faction),"Battleglest v."..getVersion().."\nsponsored by JUSTA     \nLead-Developer:     MuwuM\nLead-Artist:              titi-son\n")		
	end
end
