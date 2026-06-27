scoreboard objectives add deaths deathCount
scoreboard objectives add last_deaths dummy
scoreboard objectives add xlife_calc dummy
scoreboard objectives add xhearts dummy
scoreboard players set #const_2 xlife_calc 2
scoreboard players add @a deaths 0

execute unless data storage xhearts:config HardcoreMode run data modify storage xhearts:config HardcoreMode set value 1b
execute unless data storage xhearts:config MaxHearts run data modify storage xhearts:config MaxHearts set value 10

tellraw @a ["",{"text":"\n[X Life] Datapack v2.1 Loaded\n","color":"red","bold":true},{"text":"Use these commands to change your settings:\n","color":"gray"},{"text":"Toggle Hardcore: ","color":"white"},{"text":"/function xlife:settings/toggle_hardcore\n","color":"yellow"},{"text":"Increase Hearts: ","color":"white"},{"text":"/function xlife:settings/max_hearts/increase\n","color":"yellow"},{"text":"Decrease Hearts: ","color":"white"},{"text":"/function xlife:settings/max_hearts/decrease\n","color":"yellow"}]