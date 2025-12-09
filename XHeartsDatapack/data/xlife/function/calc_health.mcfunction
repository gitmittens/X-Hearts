scoreboard players operation @s last_deaths = @s deaths

execute store result score #temp xlife_calc run scoreboard players get @s deaths

scoreboard players add #temp xlife_calc 1

scoreboard players operation #temp xlife_calc *= #const_2 xlife_calc

execute if score #temp xlife_calc matches 21.. if data storage xhearts:config {HardcoreMode:1b} run gamemode spectator

execute store result storage xlife:ram hp int 1 run scoreboard players get #temp xlife_calc

function xlife:apply_health with storage xlife:ram