# 1. Get Max Hearts (e.g., 10)
execute store result score #max_hearts xhearts run data get storage xhearts:config MaxHearts
execute store result score #min_deaths xhearts run data get storage xhearts:config MinDeaths

# 2. Convert Max Hearts to Max HP (10 -> 20)
# We use a separate score for this so we don't overwrite the original #max_hearts
scoreboard players operation #max_hp xhearts = #max_hearts xhearts
scoreboard players operation #max_hp xhearts *= #const_2 xlife_calc

# 3. Calculate Player's "Proposed" HP based on deaths
# Formula: (Deaths + 1) * 2
execute if score @s deaths < #min_deaths xhearts run scoreboard players add @s deaths 1
execute store result score #temp xlife_calc run scoreboard players get @s deaths
scoreboard players add #temp xlife_calc 1
scoreboard players operation #temp xlife_calc *= #const_2 xlife_calc

# 4. CHECK: Is Proposed HP > Max HP?
# e.g., Player has 22 HP, Max is 20.
execute if score #temp xlife_calc > #max_hp xhearts run tag @s add capped_health

# --- HARDCORE MODE ON ---
# If they exceeded the cap, they are dead.
execute if entity @s[tag=capped_health] if data storage xhearts:config {HardcoreMode:1b} run gamemode spectator

# --- HARDCORE MODE OFF ---
# If they exceeded the cap, clamp their deaths to the max allowed.
# Math: Max Allowed Deaths = MaxHearts - 1.
execute if entity @s[tag=capped_health] unless data storage xhearts:config {HardcoreMode:1b} run scoreboard players operation @s deaths = #max_hearts xhearts
execute if entity @s[tag=capped_health] unless data storage xhearts:config {HardcoreMode:1b} run scoreboard players remove @s deaths 1

# Cleanup tag
tag @s remove capped_health

# 5. RE-CALCULATE (Recursion)
# Now that we fixed their deaths count, run this function again to get the correct HP.
# We verify they are NOT in spectator to prevent spectator loops.
execute unless entity @s[gamemode=spectator] if score #temp xlife_calc > #max_hp xhearts run return run function xlife:calc_health

# 6. APPLY HEALTH
# If we made it here, the math is safe. Update the storage RAM.
execute store result storage xlife:ram hp int 1 run scoreboard players get #temp xlife_calc
function xlife:apply_health with storage xlife:ram