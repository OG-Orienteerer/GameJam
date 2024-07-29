extends Area2D
@export var contact= false

func _on_Area2D_body_entered():
	if area_entered:
		contact=true
		print("hit")
