require("data_fonts")
require("sound/sound")

--[[
local t=table.deepcopy(data.raw["car"]["car"])
t.name="stargate"
t.icon="__stargate__/graphics/stargate/stargate_icon.png"
t.order="z"

local anim={
	filename = "__stargate__/graphics/stargate/gateanim.png",

	frame_count = 1,
	direction_count=26,
	height = 113,
	width = 116,
	line_length = 13,
	priority = "high",
	scale=0.5,
	shift = {0,0},
}

t.guns=nil

t.animation=anim

local r=table.deepcopy(data.raw.recipe.car)
r.result="stargate"
r.name="stargate"
r.enabled=true


local i=table.deepcopy(data.raw["item-with-entity-data"].car)
i.place_result="stargate"
i.name="stargate"

data:extend{t,r,i}
]]

local src={"land-mine","land-mine"}
local t=table.deepcopy(data.raw[src[1]][src[2]])
t.name="stargate-sensor"
t.icons={{icon="__stargate__/graphics/stargate/simplegate_icon.png",icon_size=32,scale=0.15}}

local anim={
	filename = "__stargate__/graphics/stargate/simplegate1.png",

	frame_count = 1,
	height = 920,
	width = 920,
	priority = "high",
	shift = {0,0},
	scale=0.0001,
}
t.collision_mask={}
t.collision_box={{-1.55,-1.55},{1.55,1.55}}
t.picture_safe=anim
t.picture_set=anim
t.flags={"not-on-map","not-deconstructable",
"not-flammable","no-automated-item-removal","no-automated-item-insertion","no-copy-paste","not-selectable-in-game",
"not-upgradable","hide-alt-info","hidden","placeable-off-grid","not-rotatable"
}
t.force_die_on_attack=false
t.trigger_force="all"
t.order="z"
t.timeout=5
t.trigger_radius=3
t.dying_explosion=nil
t.action={ type="direct",ignore_collision_condition=true,action_delivery={
	type="instant",target_effects={
		{type="create-sticker",sticker=t.name.."_sticker",trigger_created_entity=true}
	},
}}

local stick={type="sticker",name=t.name.."_sticker",animation={filename="__stargate__/graphics/stargate/simplegate_icon.png",width=1,height=1},duration_in_ticks=1}
data:extend{t,stick}


local src={"container","wooden-chest"}
local t=table.deepcopy(data.raw[src[1]][src[2]])
t.name="stargate"
t.icon=nil
t.icons={{icon="__stargate__/graphics/stargate/simplegate_icon.png",icon_size=32,scale=0.15}}
t.max_health=1000
t.order="z"
t.collision_box={{-2,-2},{2,2}}
t.selection_box={{-2,-2},{2,2}}
t.minable={mining_time=0.5,result=t.name}

local anim={
	filename = "__stargate__/graphics/stargate/simplegate1.png",

	frame_count = 1,
	height = 920,
	width = 920,
	priority = "high",
	shift = {0,0},
	scale=0.15,
}
t.picture={layers={anim}}
t.fast_replaceable_group=nil
t.corpse=nil


local rcp=table.deepcopy(data.raw.recipe[src[2]])
rcp.result=t.name
rcp.name=t.name
rcp.enabled=false
rcp.icons=t.icons
rcp.icon=nil
rcp.ingredients={{"rocket-control-unit",50},{"low-density-structure",50},{"steel-plate",100},{"battery",50},{"radar",9},{"fusion-reactor-equipment",9}}

local item=table.deepcopy(data.raw.item[src[2]])
item.place_result=t.name
item.name=t.name
item.icons=t.icons
item.icon=nil

local rsilo=data.raw.technology["rocket-silo"]
if(rsilo.effects)then table.insert(rsilo.effects,{type="unlock-recipe",recipe=t.name}) end

data:extend{t,rcp,item}



local rcp=table.deepcopy(data.raw.recipe["constant-combinator"])
local item=table.deepcopy(data.raw.item["constant-combinator"])
local ent=table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])

ent.name="stargate-dhd"
ent.minable.result=ent.name
item.name=ent.name
item.place_result=ent.name
rcp.result=item.name
rcp.name=ent.name
rcp.enabled=false
local anim={layers={{
	filename = "__stargate__/graphics/stargate/dhd.png",
	frame_count = 1,
	height = 128,
	width = 128,
	priority = "high",
	shift = {0,0},
	scale=0.3,
}}}
item.icon=nil
item.icon_size=nil
item.icons={{icon="__stargate__/graphics/stargate/dhd.png",icon_size=128,scale=0.5}}
ent.sprites={east=table.deepcopy(anim),west=table.deepcopy(anim),north=table.deepcopy(anim),south=table.deepcopy(anim)}

data:extend{rcp,item,ent}
local rsilo=data.raw.technology["rocket-silo"]
if(rsilo.effects)then table.insert(rsilo.effects,{type="unlock-recipe",recipe=rcp.name}) end

local sprite={
	name="stargate-pond",
	filename="__stargate__/graphics/stargate/simple_pond.png",
	type="sprite",
	width=554,height=554,
	scale=0.25
}
data:extend{sprite}