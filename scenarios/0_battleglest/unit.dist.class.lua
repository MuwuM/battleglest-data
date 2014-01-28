
function unit:distanceUnit(otherUnitID)
	local dist = 999999
	if units[otherUnitID] == nil then 
		dist = 999999
	elseif self.isAlive == 1 then
		local mypos=self:position()
		local otherpos=units[otherUnitID]:position()
		if mypos[1] == nil or mypos[2] == nil then print("Error1: mypos is nil!")else
		dist = ( mypos[1] - otherpos[1]) * ( mypos[1] - otherpos[1]) + ( mypos[2] - otherpos[2]) * ( mypos[2] - otherpos[2])
		if dist == nil then print("Error1: multi is nil!")else
		 dist = math.floor( math.sqrt( dist ) )
		 if dist == nil then print("Error1: sqrt is nil!")else
		 end 
		 end
		 
		 
		end
	else
		 dist = 999999
	end 
	

		if dist == nil then print("Error1: outputERROR") return 999999 else
	return dist
	end
end
function unit:distance(otherpos)
	local dist = 999999
	if otherpos == nil or otherpos[1] == nil or otherpos[2] == nil then print("Error1: otherpos") else
		
		if self.isAlive == 1 then
			local mypos=self:position()
			if mypos[1] == nil or mypos[2] == nil then print("Error1: mypos is nil!")else
				dist = ( mypos[1] - otherpos[1]) * ( mypos[1] - otherpos[1]) + ( mypos[2] - otherpos[2]) * ( mypos[2] - otherpos[2])
				if dist == nil then print("Error1: multi is nil!")else
					 dist = math.floor( math.sqrt( dist ) )
					 if dist == nil then print("Error1: sqrt is nil!")else
					 end 
				 end
			 end
		else
			 dist = 999999
		end
	end
	

	if dist == nil then print("Error1: outputERROR") return 999999 else
	return dist
	end
end
function unit:position()
	if self.isAlive == 1 then
		if self.id < 0 then
			self.location = {0,0}
		else
			self.location = unitPosition(self.id)
		end
	--else
		--self.location = {0,0}
	end
	return self.location
end
function unit:nearUnits()
	local fteam = team(self.faction)
	local i = 0
	local j = 1
	local danger = 0
	local protect = 0
	local near = {}
		for a,n in Loop:unitsForTeam(team(self.faction),1) do
			local dist_var = self:distanceUnit(units[n].id)
			if dist_var <= 9 then
				local v = units[n].id
				if units[n].isHero == 1 then
					protect = protect + 1
				elseif units[n].isTower == 1 then
					protect = protect + 1.7
				elseif units[n].isCreep == 1 then
					protect = protect + 0.1
				end
				j = j + 1
			end
		end	
		for a,n in Loop:unitsForTeam(oppteam(self.faction),1) do
			local dist_var = self:distanceUnit(units[n].id)
			if dist_var <= 9 then
				if units[n].isHero == 1 then
					danger = danger + 1
				elseif units[n].isTower == 1 then
					danger = danger + 1.3
				elseif units[n].isCreep == 1 then
					danger = danger + 0.1
				end
				j = j + 1
			end
		end
		-- end
		-- i = i+1
	--end
	near["protect"] = protect
	near["danger"] = danger
	return near
end