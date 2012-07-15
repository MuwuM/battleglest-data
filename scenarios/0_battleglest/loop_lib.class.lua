Loop = { units={}}

function Loop:reset()
	self.units = {}
end

function Loop:unitsForFaction(fid,filter)
	self:reset()
	self:addUnitsForFaction(fid,filter)
	return ipairs(self.units)
end

function Loop:unitsForTeam(tid,filter)
	self:reset()
	if tid == 1 then
		self:addUnitsForFaction(0,filter)
		self:addUnitsForFaction(1,filter)
		self:addUnitsForFaction(2,filter)
	elseif tid == 2 then
		self:addUnitsForFaction(4,filter)
		self:addUnitsForFaction(5,filter)
		self:addUnitsForFaction(6,filter)
	elseif tid == 3 then
		self:addUnitsForFaction(3,filter)
	end
	return ipairs(self.units)
end

function Loop:unitsForAll(filter)
	self:reset()
	self:addUnitsForFaction(0,filter)
	self:addUnitsForFaction(1,filter)
	self:addUnitsForFaction(2,filter)
	self:addUnitsForFaction(4,filter)
	self:addUnitsForFaction(5,filter)
	self:addUnitsForFaction(6,filter)
	self:addUnitsForFaction(3,filter)
	return ipairs(self.units)
end

function Loop:print()
	print("-----List-----")
	for a,n in ipairs(self.units) do
      print("("..a.."|"..n..")")
    end
	print("---End List---")
end

function Loop:addUnitsForFaction(fid,filter)
	local x = getUnitsForFaction(fid,'',0)
	for a,n in ipairs(x) do
		if filter == nil then
			table.insert(self.units, n)
		elseif filter == 0 then
			if units[n] == nil then
				table.insert(self.units, n)
			end
		elseif not( units[n] == nil ) then
			if filter == 1 and units[n].isAlive == 1 then
				table.insert(self.units, n)
			elseif filter == "hero" and units[n].isHero == 1 and units[n].isAlive == 1  then
				table.insert(self.units, n)
			elseif filter == "creep" and units[n].isCreep == 1 and units[n].isAlive == 1 then
				table.insert(self.units, n)
			end
		end
    end
end
