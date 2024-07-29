extends Area2D

class_name Enemy2

var speed = 5
#var gravity = 10

func _physics_process(delta):
	position += transform.x * speed
	#position += transform.y*gravity
	
	
