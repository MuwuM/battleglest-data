waypoints = {}
-- Lane 1
 waypoints[1] = {}
waypoints[1][1] = {355,355}
waypoints[1][2] = {330,330}
waypoints[1][3] = {305,305}
waypoints[1][4] = {280,280}
waypoints[1][5] = {255,255}
waypoints[1][6] = {230,230}
waypoints[1][7] = {205,205}
waypoints[1][8] = {180,180}
waypoints[1][9] = {155,155}

-- Lane 2
 -- -- waypoints[2] = {}
-- -- waypoints[2][1] = {355,370}
-- -- waypoints[2][2] = {305,370}
-- -- waypoints[2][3] = {255,370}
-- -- waypoints[2][4] = {205,370}
-- -- waypoints[2][5] = {180,370}
-- -- waypoints[2][6] = {145,362}
-- -- waypoints[2][7] = {140,330}
-- -- waypoints[2][8] = {140,305}
-- -- waypoints[2][9] = {140,255}
-- -- waypoints[2][10] = {140,205}
-- -- waypoints[2][11] = {140,155}

-- Lane 3
 -- -- waypoints[3] = {}
-- -- waypoints[3][1] = {370,355}
-- -- waypoints[3][2] = {370,305}
-- -- waypoints[3][3] = {370,255}
-- -- waypoints[3][4] = {370,205}
-- -- waypoints[3][5] = {370,180}
-- -- waypoints[3][6] = {362,145}
-- -- waypoints[3][7] = {330,140}
-- -- waypoints[3][8] = {305,140}
-- -- waypoints[3][9] = {255,140}
-- -- waypoints[3][10] = {205,140}
-- -- waypoints[3][11] = {155,140}



-- base buildings
base = {}
base[1]={371,371}
base[2]={137,137}
--towers
tower = {}
-- Lane 1
tower[1]={}
	--Team 1
	tower[1][1]={}
		tower[1][1][1]={280,280}
		tower[1][1][2]={305,305}
		tower[1][1][3]={330,330}
		tower[1][1][4]={355,355}
	--Team 2
	tower[1][2]={}
		tower[1][2][1]={230,230}
		tower[1][2][2]={205,205}
		tower[1][2][3]={180,180}
		tower[1][2][4]={155,155}
-- -- -- Lane 2
-- -- tower[2]={}
	-- -- --Team 1
	-- -- tower[2][1]={}
		-- -- tower[2][1][1]={205,370}
		-- -- tower[2][1][2]={255,370}
		-- -- tower[2][1][3]={305,370}
		-- -- tower[2][1][4]={355,370}
	-- -- --Team 2
	-- -- tower[2][2]={}
		-- -- tower[2][2][1]={140,305}
		-- -- tower[2][2][2]={140,255}
		-- -- tower[2][2][3]={140,205}
		-- -- tower[2][2][4]={140,155}
		
-- -- -- Lane 3
-- -- tower[3]={}
	-- -- --Team 1
	-- -- tower[3][1]={}
		-- -- tower[3][1][1]={370,205}
		-- -- tower[3][1][2]={370,255}
		-- -- tower[3][1][3]={370,305}
		-- -- tower[3][1][4]={370,355}
	-- -- --Team 2
	-- -- tower[3][2]={}
		-- -- tower[3][2][1]={305,140}
		-- -- tower[3][2][2]={255,140}
		-- -- tower[3][2][3]={205,140}
		-- -- tower[3][2][4]={155,140}



--regeneration areas
regarea = {}
regarea[1]={390,390} --team 1
regarea[2]={122,122} --team 2

--shops (player id)
shop = {}
shop[1]={390,371}
shop[2]={371,390}
shop[5]={122,137}
shop[6]={137,122}

--heroselection
hersosel={468,258}
--chosen heros
player_preview = {}
player_preview[1] = {460,240}
player_preview[3] = {456,240}
player_preview[2] = {476,240}
player_preview[4] = {480,240}
--mobs
mobs={}
mobs[1]={{178,332},'tingorn'}
mobs[2]={{332,182},'bug'}
mobs[3]={{332,178},'bug'}
mobs[4]={{328,182},'bug'}
mobs[5]={{328,178},'bug'}
--portshrine
portshrine={}
portshrine[1]={294,348,'Portal 1',0,6}
portshrine[2]={348,294,'Portal 2',0,4}
portshrine[3]={374,136,'Portal 4',4,8}
portshrine[4]={136,374,'Portal 2',0,2}
portshrine[5]={228,282,'Portal 3',4,7}
portshrine[6]={282,228,'Portal 1',0,1}
portshrine[7]={216,162,'Portal 3',4,5}
portshrine[8]={162,216,'Portal 4',4,3}

teleports={}