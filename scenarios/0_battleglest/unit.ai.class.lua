function unit:aimCreep()
	local aimed = 0
	local target = {0,0}
	local k = self.checkpoint
	if team(self.faction) == 1 then
		if k <= 0 then
			target = base[team(self.faction)]
		elseif k > table.getn(waypoints[self.belongToLane]) then 
			target = base[oppteam(self.faction)]
		else 
			target = waypoints[self.belongToLane][k]
		end
		givePositionCommand(self.id, "attack", target)
		if self:distance(target) < 7 then
			self.checkpoint = self.checkpoint + 1
			k = self.checkpoint
			if k <= ( table.getn(waypoints[self.belongToLane]) ) then
				if k <= 0 then
					target = base[team(self.faction)]
				elseif k > table.getn(waypoints[self.belongToLane]) then 
					target = base[oppteam(self.faction)]
				else 
					target = waypoints[self.belongToLane][k]
				end
				--print("wp "..self.id.." ("..self.belongToLane..", "..k..") = {"..target[1]..","..target[2].."}")
				givePositionCommand(self.id, "attack", target)
				--k = k + 1
			end	
		end
	else
		if k <= 0 then
			target = base[team(self.faction)]
		elseif k > table.getn(waypoints[self.belongToLane]) then 
			target = base[oppteam(self.faction)]
		else 
			target = waypoints[self.belongToLane][table.getn(waypoints[self.belongToLane]) - k]
		end
		givePositionCommand(self.id, "attack", target)
		if self:distance(target) < 7 then
			self.checkpoint = self.checkpoint + 1
			k = self.checkpoint
			if k <= ( table.getn(waypoints[self.belongToLane]) ) then
				if k <= 0 then
					target = base[team(self.faction)]
				elseif k > table.getn(waypoints[self.belongToLane]) then 
					target = base[oppteam(self.faction)]
				else 
					target = waypoints[self.belongToLane][table.getn(waypoints[self.belongToLane]) - k]
				end
				--print("wp ("..self.belongToLane..", "..k..") = {"..target[1]..","..target[2].."}")
				givePositionCommand(self.id, "attack", target)
				--k = k + 1
			end	
		end
	end
end

function unit:aimHero()
	local near = self:nearUnits()
	if(near["protect"] >= near["danger"]) then
		self:aimCreep()
	else
		self:aimBack()
	end
end

function unit:aimBack()
	self.checkpoint = self.checkpoint - 1	
	local aimed = 0
	local target = {0,0}
	local k = self.checkpoint
	if team(self.faction) == 1 then
		if k <= 0 then
			target = base[team(self.faction)]
		elseif k > table.getn(waypoints[self.belongToLane]) then 
			target = base[oppteam(self.faction)]
		else 
			target = waypoints[self.belongToLane][k]
		end
		givePositionCommand(self.id, "move", target)
	else
		if k <= 0 then
			target = base[team(self.faction)]
		elseif k > table.getn(waypoints[self.belongToLane]) then 
			target = base[oppteam(self.faction)]
		else 
			target = waypoints[self.belongToLane][table.getn(waypoints[self.belongToLane]) - k]
		end
		givePositionCommand(self.id, "move", target)
	end
end