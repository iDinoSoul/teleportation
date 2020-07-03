#Command Success
execute if entity @s[scores={tpuuid=10000..99999,tp_timer=0}] at @a[tag=!toggle_teleport] if score @p tpuuid_player = @s tpuuid run scoreboard players set @s tp_timer 300
execute if entity @s[scores={tpuuid=10000..99999,tp_timer=300}] at @a[tag=!toggle_teleport] if score @p tpuuid_player = @s tpuuid run tellraw @s [{"text":"[","color":"gray"},{"text":"Teleportation","color":"gold"},{"text":"] "},{"text":"Teleportation request sent. The player has 15 seconds to accept your request.","color":"aqua"}]
execute if entity @s[scores={tpuuid=10000..99999,tp_timer=300}] at @a[tag=!toggle_teleport] if score @p tpuuid_player = @s tpuuid run tellraw @p [{"text":"[","color":"gray"},{"text":"Teleportation","color":"gold"},{"text":"] "},{"selector":"@s","color":"gold","bold":true},{"text":" would like to teleport to you! ","color":"aqua","bold":false},{"text":"[","bold":true,"color":"gray"},{"text":"X","bold":true,"color":"gold","clickEvent":{"action":"run_command","value":"/execute at @a if score @p tpuuid = @s tpuuid_player run function teleport:loop-required/successful-tp"},"hoverEvent":{"action":"show_text","value":["",{"text":"Click to teleport this player!","color":"gold"}]}},{"text":"]","bold":true,"color":"gray"}]
execute if entity @s[scores={tpuuid=10000..99999,tp_timer=1..300}] run scoreboard players remove @s tp_timer 1

#Error -
	#Invalid ID Range
execute unless score @s tpuuid matches 10000..99999 run tellraw @s [{"text":"[","color":"gray"},{"text":"Teleportation","color":"gold"},{"text":"] "},{"text":"The ID you input is out of range. Try again with\na 5-digit ID.","color":"red"}]
execute unless score @s tpuuid matches 10000..99999 run scoreboard players set @s tpuuid 0
	#Invalid ID
execute if entity @s[scores={tpuuid=10000..99999}] at @a[distance=0.1..] unless score @p tpuuid_player = @s tpuuid run tellraw @s [{"text":"[","color":"gray"},{"text":"Teleportation","color":"gold"},{"text":"] "},{"text":"There are no players online with the ID you\nentered. Try again with a different 5-digit ID.","color":"red"}]
execute if entity @s[scores={tpuuid=10000..99999}] at @a[distance=0.1..] unless score @p tpuuid_player = @s tpuuid run scoreboard players set @s tpuuid 0
	#Recipient Teleportation Toggled Off
execute if entity @s[scores={tpuuid=10000..99999}] at @a[distance=0.1..] if score @p tpuuid_player = @s tpuuid if entity @p[tag=toggle_teleport] run tellraw @s [{"text":"[","color":"gray"},{"text":"Teleportation","color":"gold"},{"text":"] "},{"text":"The player you wish to teleport to has teleportation disabled.","color":"red"}]
execute if entity @s[scores={tpuuid=10000..99999}] at @a[distance=0.1..] if score @p tpuuid_player = @s tpuuid if entity @p[tag=toggle_teleport] run scoreboard players set @s tpuuid 0
	#Timer Expired
execute if entity @s[scores={tpuuid=10000..99999,tp_timer=1}] at @a if score @p tpuuid_player = @s tpuuid run tellraw @p [{"text":"[","color":"gray"},{"text":"Teleportation","color":"gold"},{"text":"] "},{"text":"Teleportation request expired.","color":"red"}]
execute if entity @s[scores={tpuuid=10000..99999,tp_timer=1}] run tellraw @s [{"text":"[","color":"gray"},{"text":"Teleportation","color":"gold"},{"text":"] "},{"text":"The player did not respond in time.","color":"red"}]
execute if entity @s[scores={tpuuid=10000..99999,tp_timer=1}] run function teleport:loop-required/initialize-tp
	#Missing Teleport Prompt
execute as @a[tag=!tpSend,scores={tpuuid=1..}] run tellraw @s [{"text":"[","color":"gray"},{"text":"Teleportation","color":"gold"},{"text":"] "},{"text":"You must use /trigger tp before you attempt to\nset a TP ID.","color":"red"}]
execute as @a[tag=!tpSend,scores={tpuuid=1..}] run scoreboard players set @s tpuuid 0