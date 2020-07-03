#Enable Scoreboards
scoreboard players enable @a new_id
scoreboard players enable @a teleporthelp
scoreboard players enable @a toggle_teleport
scoreboard players enable @a tp
scoreboard players enable @a tpc
scoreboard players enable @a tpuuid

#Give Initial ID
execute as @a unless entity @s[tag=tpuuid_player,scores={tpuuid_player=10000..99999}] at @s run function teleport:launch-required/get-new-id
#Run Help
execute if entity @a[scores={teleporthelp=1..}] run function teleport:launch-required/teleport-help

#Run Teleport Toggle
execute as @a[scores={toggle_teleport=1..}] run function teleport:launch-required/toggle/toggle-teleport
#Run NewID
execute as @a[scores={new_id=1..}] run function teleport:launch-required/get-new-id

#Run TP Send
execute if entity @a[scores={tp=1..}] run function teleport:loop-required/tp
#Run TP Cancel
execute if entity @a[scores={tpc=1..}] run function teleport:loop-required/tpc
#Run TPUUID
execute as @a[scores={tpuuid=1..}] at @s run function teleport:loop-required/teleport-players