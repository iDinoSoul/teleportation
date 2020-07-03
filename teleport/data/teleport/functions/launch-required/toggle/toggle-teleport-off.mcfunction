tag @s remove toggle_teleport
tellraw @s [{"text":"[","color":"gray"},{"text":"Teleportation","color":"gold"},{"text":"] "},{"text":"Teleporting toggled: "},{"text":"ON","color":"green"}]
scoreboard players set @s toggle_teleport 0