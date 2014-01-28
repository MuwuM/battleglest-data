if startup_state == 1 then
	startup_state = 0
	current_selection = "bai_zaa"
	unit:create('selector_bai_zaa', player_order[1],hersosel)
	setCameraPosition(hersosel)
	networkShowMessageForFaction("selection_text", "selection_headline", player_order[(heros_selected + 1)])
	--print("Player "..player_order[(heros_selected + 1)].." selected: "..clearname(current_selection))
else
	if selecting == 1 then
		selecting = 0
		addConsoleLangText("selected_hero",getPlayerName(player_order[(heros_selected + 1)]),clearname(current_selection))
		herosOfPlayersabc[player_order[(heros_selected + 1)]] = current_selection
		
		
		unit:create('selector_'..herosOfPlayersabc[player_order[(heros_selected + 1)]]..'_', player_order[(heros_selected + 1)],player_preview[(heros_selected + 1)])
		heros_selected = heros_selected + 1
		if heros_selected < 4 then
			networkShowMessageForFaction("selection_text", "selection_headline", player_order[(heros_selected + 1)])
		end
		while heros_selected < 4 and isAI(player_order[(heros_selected + 1)]) > 0 do
			addConsoleLangText("selected_hero","Bot "..(player_order[(heros_selected + 1)]),clearname(herosOfPlayersabc[player_order[(heros_selected + 1)]]))
		unit:create('selector_'..herosOfPlayersabc[player_order[(heros_selected + 1)]]..'_', player_order[(heros_selected + 1)],player_preview[(heros_selected + 1)])
			heros_selected = heros_selected + 1
		end
		if heros_selected >= 4 then
			selection_timer = startEfficientTimerEvent(10)
		else
			current_selection = "bai_zaa"
			unit:create('selector_bai_zaa', player_order[(heros_selected + 1)],hersosel)
		end
	end
end