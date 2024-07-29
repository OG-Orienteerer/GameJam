extends CharacterBody2D

@export var speed = 300
@export var gravity = 30
@export var jump_force = 300
var BlobJump

func _physics_process(delta):
	if !is_on_floor():
		velocity.y +=gravity
		if velocity.y>500:
			velocity.y = 500
	
	if is_on_floor():
		BlobJump=0
	
	if Input.is_action_just_pressed("jump_blob") && (is_on_floor()): # || BlobJump==1) :
		velocity.y=-jump_force
		BlobJump=BlobJump+1
		
	var horizontal_direction = Input.get_axis("left_blob", "right_blob")
	
	velocity.x=speed * horizontal_direction
	
	move_and_slide()
