#Command Success -
	#Initialize TP
tp @p @s
execute at @s run tellraw @a[distance=..0.1] [{"text":"[","color":"gray"},{"text":"Teleportation","color":"gold"},{"text":"] "},{"text":"Teleportation successful.","color":"aqua"}]
execute at @s as @a[distance=..0.1] run function teleport:loop-required/initialize-tp
