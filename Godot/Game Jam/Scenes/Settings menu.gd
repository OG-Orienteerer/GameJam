extends Control

@onready var vol_slider = $MarginContainer/Buttons/Master_Volume as HSlider

@export_enum("Master") var bus_name : String

# Called when the node enters the scene tree for the first time.
func _ready():
	vol_slider.value_changed.connect(on_volume_value_changed)
	get_bus_name_by_index()
	set_slider_value()
	

var bus_index : int = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func get_bus_name_by_index() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	
func set_slider_value() -> void:
	vol_slider.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))

func on_volume_value_changed(value : float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))

func _on_return_btn_button_down():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
