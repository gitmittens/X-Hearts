scoreboard objectives add deaths deathCount
scoreboard objectives add last_deaths dummy
scoreboard objectives add xlife_calc dummy
scoreboard players set #const_2 xlife_calc 2
scoreboard players add @a deaths 0
execute as @a run function xlife:calc_health
tellraw @a {"text":"[X Life] Datapack Loaded","color":"red"}

