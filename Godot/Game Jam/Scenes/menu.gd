extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_select_menu.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/Settings menu.tscn")

func _on_quit_pressed():
	get_tree().quit()
