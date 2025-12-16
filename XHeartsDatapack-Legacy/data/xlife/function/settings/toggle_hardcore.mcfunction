# 1. Clear temp tags just in case
tag @s remove xhearts_is_currently_on

# 2. Snapshot the current state: Is it ON right now?
execute if data storage xhearts:config {HardcoreMode:1b} run tag @s add xhearts_is_currently_on

# 3. LOGIC: If it WAS on, turn it OFF.
execute if entity @s[tag=xhearts_is_currently_on] run data modify storage xhearts:config HardcoreMode set value 0b

# 4. LOGIC: If it WAS NOT on, turn it ON.
execute unless entity @s[tag=xhearts_is_currently_on] run data modify storage xhearts:config HardcoreMode set value 1b

# 5. Feedback & Cleanup
execute if data storage xhearts:config {HardcoreMode:1b} run tellraw @a {"text":"Hardcore Mode: ENABLED","color":"red"}
execute unless data storage xhearts:config {HardcoreMode:1b} run tellraw @a {"text":"Hardcore Mode: DISABLED","color":"green"}

tag @s remove xhearts_is_currently_on