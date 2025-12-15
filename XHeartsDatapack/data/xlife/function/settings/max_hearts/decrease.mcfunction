# 1. Load into temp score
execute store result score #temp xhearts run data get storage xhearts:config MaxHearts

# 2. Subtract 1
scoreboard players remove #temp xhearts 1

# 3. Safety: Don't let it go below 1 (or 10, your choice)
execute if score #temp xhearts matches ..0 run scoreboard players set #temp xhearts 1

# 4. Save back to Storage
execute store result storage xhearts:config MaxHearts int 1 run scoreboard players get #temp xhearts

# 5. Feedback
tellraw @a [{"text":"Max Hearts set to: ","color":"green"},{"nbt":"MaxHearts","storage":"xhearts:config","color":"white"}]