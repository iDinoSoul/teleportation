#Display Success Mesage
execute as @a[scores={tpc=1..}] unless entity @s[scores={tp=0}] run tellraw @s [{"text":"[","color":"gray"},{"text":"Teleportation","color":"gold"},{"text":"] "},{"text":"Teleport prompt cancelled.","color":"aqua"}]
#Error - Repeated Cancel
tellraw @a[scores={tpc=1..,tp=0}] [{"text":"[","color":"gray"},{"text":"Teleportation","color":"gold"},{"text":"] "},{"text":"You have no pending teleport prompt.","color":"red"}]

#Restore TP Timer
scoreboard players set @a[scores={tpc=1..,tp_timer=1..}] tp_timer 0
#Restore TP Send
tag @a[tag=tpSend,scores={tpc=1..,tp=1..}] remove tpSend
scoreboard players set @a[scores={tpc=1..,tp=1..}] tp 0
#Restore TP Cancel
scoreboard players set @a[scores={tpc=1..}] tpc 0