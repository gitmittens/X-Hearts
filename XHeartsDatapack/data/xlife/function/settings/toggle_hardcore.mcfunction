# 1. Check current state. If TRUE (1b), switch to FALSE (0b)
execute if data storage xhearts:config {HardcoreMode:1b} run data modify storage xhearts:config HardcoreMode set value 0b

# 2. If it is now FALSE (0b) (meaning we just turned it off), verify and tag the player so we don't accidentally turn it back on in the next step
execute unless data storage xhearts:config {HardcoreMode:1b} run tag @s add xh_just_toggled

# 3. If NOT tagged (meaning it started as False), switch to TRUE (1b)
execute unless entity @s[tag=xh_just_toggled] run data modify storage xhearts:config HardcoreMode set value 1b

# 4. Cleanup the tag
tag @s remove xh_just_toggled

# 5. Feedback Message
execute if data storage xhearts:config {HardcoreMode:1b} run tellraw @a {"text":"Hardcore Mode: ENABLED","color":"red","bold":true}
execute unless data storage xhearts:config {HardcoreMode:1b} run tellraw @a {"text":"Hardcore Mode: DISABLED","color":"green","bold":true}