extends Node

var levels = {
	"res://Scenes/Levels/level_1.tscn" : {
		"name" : "First Steps",
		"unlocked" : true,
		"unlocks" : "What's that?",
		"completed" : false,
	},
	"res://Scenes/Levels/level_2.tscn" : {
		"name" : "What's that?",
		"unlocked" : false,
		"unlocks" : "placeholder1",
		"completed" : false,
	},
		"res://Scenes/Levels/level_3.tscn" : {
		"name" : "placeholder1",
		"unlocked" : false,
		"unlocks" : "placeholder2",
		"completed" : false,
	},
		"res://Scenes/Levels/level_4.tscn" : {
		"name" : "placeholder2",
		"unlocked" : false,
		"unlocks" : "placeholder3",
		"completed" : false,
	},
		"res://Scenes/Levels/level_5.tscn" : {
		"name" : "placeholder3",
		"unlocked" : false,
		"unlocks" : "placeholder4",
		"completed" : false,
	},
		"res://Scenes/Levels/level_6.tscn" : {
		"name" : "placeholder4",
		"unlocked" : false,
		"unlocks" : "placeholder5",
		"completed" : false,
	},
		"res://Scenes/Levels/level_7.tscn" : {
		"name" : "placeholder5",
		"unlocked" : false,
		"unlocks" : "placeholder6",
		"completed" : false,
	},
		"res://Scenes/Levels/level_8.tscn" : {
		"name" : "placeholder6",
		"unlocked" : false,
		"unlocks" : "placeholder7",
		"completed" : false,
	},
		"res://Scenes/Levels/level_9.tscn" : {
		"name" : "placeholder7",
		"unlocked" : false,
		"unlocks" : "placeholder8",
		"completed" : false,
	},
		"res://Scenes/Levels/level_10.tscn" : {
		"name" : "placeholder8",
		"unlocked" : false,
		"unlocks" : "placeholder9",
		"completed" : false,
	},
}


var current_lvl = ""

var is_in_game = false
var runtime = 0.0

func load_lvl(target_lvl):
	if ResourceLoader.exists(target_lvl):
		get_tree().change_scene_to_file(target_lvl)
	else:
		print("ERROR: Level Not Found")
	
	current_lvl = target_lvl
	is_in_game = true
	
func win_lvl():
	for level in levels:
		if levels[level]["name"] == levels[current_lvl]["unlocks"]:
			levels[level]["unlocked"] = true
			
		if level == current_lvl:
			if levels[current_lvl]["completed"] == false:
				levels[current_lvl]["completed"] = true
	
	current_lvl = null
	is_in_game = false
	runtime = 0.0
	get_tree().change_scene_to_file("res://Scenes/level_select_menu.tscn")
	
func _process(delta):
	if is_in_game:
		runtime +=delta
		
	if Input.is_action_just_pressed("exit-level"):
		current_lvl = null
		is_in_game = false
		runtime = 0.0
		get_tree().change_scene_to_file("res://Scenes/level_select_menu.tscn")
	

func _on_exit_button_button_down():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")  



