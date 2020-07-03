#Initialize
scoreboard players set @s[tag=tpuuid_player] tpuuid_player 0
tag @s[tag=tpuuid_player] remove tpuuid_player

#Grant New ID -
	#Initialize UUIDCloud
summon area_effect_cloud ~ ~ ~ {Tags:["uuid_cloud"],Particle:"block air",Duration:0,Radius:0f}
execute as @e[type=area_effect_cloud,tag=uuid_cloud,distance=..0.1,limit=1] unless score @s tpuuid_player matches -99999..99999 store result score @s tpuuid_player run data get entity @s UUIDMost 0.00000000000001
	#Turn Positive and/or Scale to 5-Digits
scoreboard players operation @e[type=area_effect_cloud,tag=uuid_cloud,scores={tpuuid_player=-99999..-1},distance=..0.1,limit=1] tpuuid_player *= -1 tpuuid_player
scoreboard players operation @e[type=area_effect_cloud,tag=uuid_cloud,scores={tpuuid_player=1000..9999},distance=..0.1,limit=1] tpuuid_player *= 10 tpuuid_player
	#Copy TPUUID Score to Player
scoreboard players operation @s tpuuid_player = @e[type=area_effect_cloud,tag=uuid_cloud,scores={tpuuid_player=10000..99999},distance=..0.1,limit=1] tpuuid_player
	#Restart If Needed
execute if entity @s[scores={new_id=1..}] run tellraw @s [{"text":"[","color":"gray"},{"text":"Teleportation","color":"gold"},{"text":"] "},{"text":"New teleport ID successfully obtained.","color":"aqua"}]
execute if entity @s[scores={new_id=1..}] run scoreboard players set @s new_id 0
execute if entity @s[scores={tpuuid_player=10000..99999}] run tag @s add tpuuid_player