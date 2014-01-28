local i = 1

while i <= table.getn(portshrine) do
	if triggeredCellEventId() == teleports[i] then
		local triggering= triggeredEventAreaEntryUnitId()
		if units[triggering] == nil then else
			posx = portshrine[portshrine[i][5]][1]
			if posx > 256 then
				posx = posx - 2
			else
				posx = posx + 2
			end
			posy = portshrine[portshrine[i][5]][2]
			if posy > 256 then
				posy = posy - 2
			else
				posy = posy + 2
			end
			if  units[triggering].isHero == 1 and isFreeCells(3, 0,{posx,posy}) == 1 then
				--givePositionCommand(triggering,'move',{posx,posy})
				giveStopCommand(triggering)
				setUnitPosition(triggering,{posx,posy})
				networkSetCameraPositionForFaction(unitFaction(triggering),{posx,posy})
			end
		end
	end
	i = i + 1
end

