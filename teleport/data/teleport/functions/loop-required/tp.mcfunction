#Command Success
tellraw @a[tag=!tpSend,scores={tp=1}] [{"text":"[","color":"gray"},{"text":"Teleportation","color":"gold"},{"text":"] "},{"text":"Teleport prompt set. Enter the 5-digit ID of the\nplayer you wish to teleport to using ","color":"aqua"},{"text":"/trigger tpuuid set <ID>","color":"gold","hoverEvent":{"action":"show_text","value":{"text":"Click to paste into chat!","color":"gold"}},"clickEvent":{"action":"suggest_command","value":"/trigger tpuuid set "}},{"text":".","color":"aqua"}]
tag @a[tag=!tpSend,scores={tp=1}] add tpSend

#Error -
	#Multiple Attempts
tellraw @a[tag=tpSend,scores={tp=2..}] [{"text":"[","color":"gray"},{"text":"Teleportation","color":"gold"},{"text":"] "},{"text":"Do not attempt to set multiple teleport prompts.","color":"red"}]
scoreboard players set @a[scores={tp=2..}] tp 1