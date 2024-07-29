extends CharacterBody2D

@export var speed = 300
@export var gravity = 30
var direction = 1

func _physics_process(delta):
	
	if is_on_floor():
		var direction=1
	
	if velocity.x==0:
		direction=-direction
	
	if !is_on_floor():
		velocity.y +=gravity
		if velocity.y>500:
			velocity.y = 500
	
	velocity.x=speed * direction
	
	move_and_slide()
	
	print(velocity.x)
