# 1. Load into score
execute store result score #temp xhearts run data get storage xhearts:config MaxHearts

# SAFETY: If it somehow loaded as 0 (bug), force it to 10 before adding
execute if score #temp xhearts matches 0 run scoreboard players set #temp xhearts 10

# 2. Add 1
scoreboard players add #temp xhearts 1

# 3. Save back
execute store result storage xhearts:config MaxHearts int 1 run scoreboard players get #temp xhearts

# 4. Feedback
tellraw @a [{"text":"Max Hearts set to: ","color":"green"},{"nbt":"MaxHearts","storage":"xhearts:config","color":"white"}]