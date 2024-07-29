extends StaticBody2D

@onready var player = load("res://Scenes/player.tscn")
#var Destroy = player.flame_state["destructive"]
#var Destroy = Player.Destructive
var Presence

func _physics_process(delta):
	if Presence==1 && Player.Destructive==1:
		get_node("HitBox").set_deferred("disabled", true)
		hide()
	#pass
	#print(Player.Destructive)
	#print(Destroy)


func _on_area_2d_area_entered(area):
	if area.name=="FlameArea":
		Presence=1
		print("Destroyable")
		#print(Destroy)
