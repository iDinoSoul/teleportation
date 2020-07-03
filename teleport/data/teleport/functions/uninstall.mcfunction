#Remove Scoreboards
scoreboard objectives remove new_id
scoreboard objectives remove teleporthelp
scoreboard objectives remove toggle_teleport
scoreboard objectives remove tp_timer
scoreboard objectives remove tp
scoreboard objectives remove tpc
scoreboard objectives remove tpuuid
scoreboard objectives remove tpuuid_player

#Remove tags
tag @a remove tpuuid_player

#Remove Scoreboard List
scoreboard objectives setdisplay list

#Disable Datapack
datapack disable "file/teleport"

#Success Message
tellraw @a[tag=Admin] [{"text":"[","color":"gray"},{"text":"Teleportation","color":"gold"},{"text":"] "},{"text":"Datapack successfully removed. Click ","bold":false},{"text":"here","color":"gold","clickEvent":{"action":"run_command","value":"/datapack enable \"file/teleport\""}},{"text":" to magically reinstall the datapack."}]