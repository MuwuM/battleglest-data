respawn_units = {}
respawn_unit = {timeleft = 0, faction=0,name="", isHero=0,isCreep = 0,belongToLane=0,isBase=0, location={0,0},experience=0,respawned = 0}
function respawn_unit:new (o)
      o = o or unit
      setmetatable(o, self)
      self.__index = self
      return o
end

function respawn_unit:createHero(name, faction, pos, expe, lastrespawn)
	self.faction = faction
	self.name = name
	self.isHero = 1
	self.location = pos
	self.experience = expe
	self.timeleft = lastrespawn 
	self.respawned = lastrespawn + 5
	self.id = table.getn(respawn_units) + 1
	giveResource("my_deathtime", self.faction, self.timeleft)
	table.insert (respawn_units,1,self)
end
function respawn_unit:create(name, faction, pos, expe,timeleft)
	self.faction = faction
	self.name = name
	self.isHero = 0
	self.location = pos
	self.experience = 0
	self.timeleft = timeleft
	self.id = table.getn(respawn_units) + 1
	table.insert (respawn_units,1,self)
end
function respawn_unit:respawn()
	if self.isHero == 1 then
		self:respawnHero()
	else
		if self.name == "bug" then
			local makeUnit = unit:new{}
			makeUnit:create(self.name, self.faction,self.location)
			makeUnit:create(self.name, self.faction,self.location)
			makeUnit:create(self.name, self.faction,self.location)
			makeUnit:create(self.name, self.faction,self.location)
		else
			local makeUnit = unit:new{}
			makeUnit:create(self.name, self.faction,self.location)
		end
	end
end
function respawn_unit:respawnHero()
	--if self.name == "RESPAWNED" then else
		fteam = team(self.faction)
		makeHeros = unit:new{}
		if fteam == 1 then
			makeHeros:createHero(self.name, self.faction, regarea[1])
		elseif fteam == 2 then
			makeHeros:createHero(self.name, self.faction, regarea[2])
		end
		makeHeros.respawn = self.respawned + 1
		giveKills(makeHeros.id,self.experience)
		--self.name = "RESPAWNED"
	--end
	--table.remove(respawn_units,self.id)
end
