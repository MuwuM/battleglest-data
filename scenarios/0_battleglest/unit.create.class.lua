function unit:create(name, faction, pos)
	createUnitNoSpacing(name, faction, pos)
	self.isAlive = 1
	self.id = lastCreatedUnit()
	self.faction = faction
	self.name = lastCreatedUnitName()
	self.isTower = 0
	table.insert (units, self.id, self)
	units[self.id] = self
	self:position()
end

function unit:createTower(faction,laneX, pos)

	fteam = team(faction)
	if fteam == 1 then
		fmod = 1
	else 
		fmod = (-1)
	end
	
	createUnitNoSpacing("tower", faction, pos)
	self.isAlive = 1
	self.id = lastCreatedUnit()
	self.faction = faction
	self.name = lastCreatedUnitName()
	self.isTower = 1
	self.belongToLane = laneX
	if debugLanes == 1 then
		giveKills(self.id,(self.belongToLane*1000))
	end
	towersalive[fteam] = towersalive[fteam] + 1
	table.insert (towers, self.id)
	table.insert (units, self.id, self)
	units[self.id] = self

	self.isAIcontroled = 1
	self:position()

end

function unit:createBase(faction, pos)
	fteam = team(faction)
	if fteam == 1 then
		fmod = 1
	else 
		fmod = (-1)
	end
	
	createUnitNoSpacing("base", faction, pos)
	self.isAlive = 1
	self.id = lastCreatedUnit()
	self.faction = faction
	self.name = lastCreatedUnitName()
	self.isBase = 1
	table.insert (units, self.id, self)
	units[self.id] = self

	if healcircles == 1 then
		self.healcircle = unit:new{}
		self.healcircle:create("healcircle", faction, regarea[fteam])
	end
	self.isAIcontroled = 1
	self:position()
end

function unit:createCreep(faction,laneX)
	fteam = team(faction)
	if fteam == 1 then
		fmod = 1
	else 
		fmod = (-1)
	end
	
	
	--createUnitNoSpacing("creep", faction, regarea[fteam])
	createUnitNoSpacing("creep", faction, base[fteam])
	self.isAlive = 1
	self.id = lastCreatedUnit()
	self.faction = faction
	self.name = lastCreatedUnitName()
	self.isCreep = 1
	self.belongToLane=laneX
	if debugLanes == 1 then
		giveKills(self.id,(self.belongToLane*100))
	end
	table.insert (units, self.id, self)
	units[self.id] = self
	self.isAIcontroled = 1
	self:position()
	self.checkpoint = 0
end

function unit:createDCreep(faction,laneX)
	fteam = team(faction)
	if fteam == 1 then
		fmod = 1
	else 
		fmod = (-1)
	end
	

	--createUnitNoSpacing("creep_", faction, regarea[fteam])
	createUnitNoSpacing("creep_", faction, base[fteam])
	self.isAlive = 1
	self.id = lastCreatedUnit()
	self.faction = faction
	self.name = lastCreatedUnitName()
	self.isCreep = 1
	self.belongToLane=laneX
	if debugLanes == 1 then
		giveKills(self.id,(self.belongToLane*100))
	end
	table.insert (units, self.id, self)
	units[self.id] = self
	self.isAIcontroled = 1
	self:position()
	self.checkpoint = 0
end
function unit:createUCreep(faction,laneX)
	fteam = team(faction)
	if fteam == 1 then
		fmod = 1
	else 
		fmod = (-1)
	end

	--createUnitNoSpacing("mega_creep", faction, regarea[fteam])
	createUnitNoSpacing("mega_creep", faction, base[fteam])
	self.isAlive = 1
	self.id = lastCreatedUnit()
	self.faction = faction
	self.name = lastCreatedUnitName()
	self.isCreep = 1
	self.belongToLane=laneX
	if debugLanes == 1 then
		giveKills(self.id,(self.belongToLane*100))
	end
	table.insert (units, self.id, self)
	units[self.id] = self
	self.isAIcontroled = 1
	self:position()
	self.checkpoint = 0
end

function unit:createHero(name, faction, pos)
	fteam = team(faction)
	if fteam == 1 then
		fmod = 1
		createUnit(name, faction, {regarea[1][1] , regarea[1][2] - 2 })
	else 
		fmod = (-1)
		createUnit(name, faction, {regarea[2][1] , regarea[2][2] + 2 })
	end

	
	self.isAlive = 1
	self.id = lastCreatedUnit()
	self.faction = faction
	self.name = lastCreatedUnitName()
	self.isTower = 0
	self.isHero = 1
	if isAI(self.faction) == 0 then
		self.isAIcontroled = 0
	else
		self.isAIcontroled = 1
		table.insert (herosAI,1, self.id)
		setRandomGenInit(getWorldFrameCount()*self.id)
		self.belongToLane = getRandomGen(1,table.getn(waypoints))
		if self.belongToLane < 1 then
			self.belongToLane = 1
		elseif self.belongToLane > table.getn(waypoints) then
			self.belongToLane = table.getn(waypoints)
		end
		self:aimCreep()
	end
	table.insert (units, self.id, self)
	units[self.id] = self
	table.insert (heros, self.id)
	self.respawn = 20
	networkSetCameraPositionForFaction(faction,self:position())
	networkselectUnit(faction,self.id)
	networkaddUnitToGroupSelection(faction,self.id,1)
end

