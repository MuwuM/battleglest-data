if lastAttackedUnitName() == "tingorn" then
	if units[lastAttackedUnit()] == nil then
		print("Error: nil value");
	else
		if units[lastAttackedUnit()]:distance({ 180 , 330 }) > 7 then
			givePositionCommand(units[lastAttackedUnit()].id, "move", { 180 , 330 })
		end
	end
end