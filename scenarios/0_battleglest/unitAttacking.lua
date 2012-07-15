if lastAttackingUnitName() == "tingorn" then
	if units[lastAttackingUnit()] == nil then
		print("Error: nil value");
	else
		if units[lastAttackingUnit()]:distance({ 178 , 332 }) > 14 then
			givePositionCommand(units[lastAttackingUnit()].id, "move", { 178 , 332 })
		end
	end
end