tag @s add toggle_teleport
tellraw @s [{"text":"[","color":"gray"},{"text":"Teleportation","color":"gold"},{"text":"] "},{"text":"Teleporting toggled: "},{"text":"OFF","color":"red"}]
scoreboard players set @s toggle_teleport 0