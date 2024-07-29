extends CharacterBody2D

class_name player1

@export var speed = 300
@export var gravity = 30
@export var jump_force = 1000
var BlobJump
var Chex = 0
var Chey = 0
var WallClimbA
var FreezeA
var ChargeA
var HeavyA
var StretchA
var StrongA
var WallClimb
var Freeze
var Charge
var Heavy
var Stretch
var Strong
var Climbable

func _physics_process(delta):
	if !is_on_floor():                            #gravity
		velocity.y +=gravity
		if velocity.y>500:
			velocity.y = 500
	
	
	if is_on_floor():                              #reset jumps
		BlobJump=0
	
	if Input.is_action_just_pressed("jump_blob") && (is_on_floor()): # || BlobJump==1) :       #Jump with optional double
		velocity.y=-jump_force
		BlobJump=BlobJump+1
		
	var horizontal_direction = Input.get_axis("left_blob", "right_blob")                       #directional movement
	
	velocity.x=speed * horizontal_direction
	
	move_and_slide()
	
	if WallClimbA==1 && Input.is_action_just_pressed("blob_power"):                               #Climbing Power
		WallClimb=1
		print("Monkey")
	if WallClimb==1 && Input.is_action_pressed("jump_blob") && Climbable==1:
		velocity.y=-2*gravity



func _on_area_2d_body_entered(body):
	#print(body.name)
	if body.name=="Darkness" || body.name=="InkCore" || body.name=="Branch":
		print("hit")
		position.x=Chex
		position.y=Chey



func _on_blob_area_area_entered(area):
	if area.name=="BP1":
		WallClimbA=1
	if area.name=="Wall":
		Climbable=1
	
	
	if area.name=="BP2":
		FreezeA=1
	if area.name=="BP3":
		ChargeA=1
	if area.name=="BP4":
		HeavyA=1
	if area.name=="BP5":
		StretchA=1
	if area.name=="BP6":
		StrongA=1



func _on_blob_area_area_exited(area):
	if area.name=="BP1":
		WallClimbA=0
	if area.name=="Wall":
		Climbable=0
		print("There")
	
	if area.name=="BP2":
		FreezeA=0
	if area.name=="BP3":
		ChargeA=0
	if area.name=="BP4":
		HeavyA=0
	if area.name=="BP5":
		StretchA=0
	if area.name=="BP6":
		StrongA=0
