-- in unit.class.lua
maxUnitID = 0 --999999
units = {}
towers = {}
heros = {}
herosAI = {}
unit = {id=(-1),faction=0,name="",isAlive = 0, isHero=0,isTower=0,isCreep = 0,belongToLane=0,isBase=0,checkpoint=0, location={0,0},isAIcontroled=0,level=0,respawn=(-1),experience=0}
function unit:new (o)
      o = o or unit
      setmetatable(o, self)
      self.__index = self
      return o
end

function unit:die()
	self = self or unit
	self.isAlive = 0
end


dofile(getSystemMacroValue("$SCENARIO_PATH").."unit.create.class.lua")
dofile(getSystemMacroValue("$SCENARIO_PATH").."unit.dist.class.lua")
dofile(getSystemMacroValue("$SCENARIO_PATH").."unit.ai.class.lua")