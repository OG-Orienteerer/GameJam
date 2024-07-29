extends Node

var target_lvl = ""

func _on_button_pressed():
	if Levelmanagement.levels[target_lvl]["unlocked"]:
		Levelmanagement.load_lvl(target_lvl)
	else:
		print("Unlock this level by completing the previous levels first.")
