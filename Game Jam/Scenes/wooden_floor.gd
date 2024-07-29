extends StaticBody2D

#@onready var player = load("res://Scenes/player.tscn")
var Presence

func _physics_process(delta):
	#print(Player.Cold)
	if Presence==1 && Player.Cold==0:
		get_node("HitBox").set_deferred("disabled", true)
		hide()


func _on_area_2d_area_entered(area):
	if area.name=="FlameArea":
		Presence=1
