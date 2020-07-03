#Add Scoreboards
function teleport:launch-required/generate/generate-scoreboards

#Independent Variable Initialization
function teleport:launch-required/generate/generate-vars

#Scoreboard Setup
scoreboard objectives setdisplay list tpuuid_player
execute as @a[tag=!tpuuid_player] at @s run function teleport:launch-required/get-new-id

#Welcome Message
tellraw @a[tag=Admin] [{"text":"- Teleportation -","color":"gold","bold":true},{"text":"\nA multiplayer-friendly datapack that allows mutually-agreed\nteleportation between players! ","color":"gray","bold":false},{"text":"\n\nVersion: ","color":"gray","bold":false},{"text":"1.0\n\n","color":"green"},{"text":"Need help? Use ","color":"gray","bold":false},{"text":"/trigger teleporthelp","color":"gold","bold":false,"clickEvent":{"action":"run_command","value":"/trigger teleporthelp"}},{"text":" to view the help page.","color":"gray","bold":false}]