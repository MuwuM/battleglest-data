dofile(getSystemMacroValue("$SCENARIO_PATH").."functions.lua")
dofile(getSystemMacroValue("$SCENARIO_PATH").."loop_lib.class.lua")
dofile(getSystemMacroValue("$SCENARIO_PATH").."unit.class.lua")
dofile(getSystemMacroValue("$SCENARIO_PATH").."respawn.class.lua")

isalive = {}
iscreep = {}
ishero={}
TowerMidTeam1 = {}
TowerMidTeam2 = {}
hero = {}

kills ={}
kills[1] = 0
kills[2] = 0
kills[3] = 0
towersalive ={}
towersalive[1] = 0
towersalive[2] = 0
towersalive[3] = 0

ultracreeps ={}
ultracreeps[1] = 0
ultracreeps[2] = 0
ultracreeps[3] = 0
--your units

laneMid={}
laneMid[1]={255,255}
laneMid[2]={150,360}
laneMid[3]={360,150}
lane={}
lane[1] ={}
lane[2] = {}
lane[1][1]={}
lane[1][2]={}
lane[1][3]={}
lane[2][1]={}
lane[2][2]={}
lane[2][3]={}

timer_event1 = nil
firstspawn = 1
lastspawntimer=0
timeleft=0

aiTimer = nil
lastAItimer = 0
aiIsWorking = 0
timer_event2 = nil
aiTimeLoop = 0
aiEnabled = 0
timer_gold = nil
goldLoop = 0
timer_respawn = nil

killed_bugs = 0

camera ={}
camera[1] = {488,240}
camera[2] = {448,240}

startup_state = 1
heros_selected = 0
lanes_loaded = 0
endofgame = 0

heros_per_team = {}
heros_per_team[1] = {}
heros_per_team[2] = {}
current_selection = ""

player_order = {}
player_order[1] = 1
player_order[2] = 5
player_order[3] = 2
player_order[4] = 6


intromusic = scenarioDir().."../../mods/battleglest/data/core/menu/music/nomoremagic_5.ogg"


selection_timer = nil
selecting = 0

herotimer = 0

dofile(getSystemMacroValue("$SCENARIO_PATH").."lanes.res.lua")