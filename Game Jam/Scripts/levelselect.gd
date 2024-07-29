extends Node


@onready var level_element_scene = load("res://Scripts/lvl_btn.gd")

func _ready():
	for level in Levelmanagement.levels:
		var spawned_element = level_element_scene.instantiate()
	
		spawned_element.get_node("Level Title").get_node("Button").text = Levelmanagement.levels[level]["name"]
		
