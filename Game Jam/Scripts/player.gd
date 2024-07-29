extends CharacterBody2D

class_name player2

@export var speed = 300
@export var gravity = 30
@export var jump_force = 400
var Chex = 900
var Chey = 0
var x
var FlameJumpA = 0
var DestructiveA = 0
var WaterproofA = 0
var ColdA = 0
var FlameJump = 0
var Destructive = 0 
var Waterproof = 0 
var Cold = 0 
var jumpcount=0
#var flame_state = {
#	"destructive" : false,
#	"Cold" : false,
	#}

func _physics_process(delta):	
	if !is_on_floor():
		velocity.y +=gravity
		if velocity.y>500:
			velocity.y = 500
	
	if is_on_floor():
		jumpcount=0
	
	if !is_on_floor:
		print("float")
	
	if Input.is_action_just_pressed("jump_flame")  && is_on_floor():
		velocity.y=-jump_force
		jumpcount+=1
	if Input.is_action_just_pressed("jump_flame")  &&  FlameJump==1 && !is_on_floor() && jumpcount<2:
		print("WEE!")
		velocity.y=-jump_force
		jumpcount+=1
	
	var horizontal_direction = Input.get_axis("left_flame", "right_flame")
	
	velocity.x=speed * horizontal_direction
	
	move_and_slide()
	
	if FlameJumpA==1 && Input.is_action_just_pressed("flame_power"):
		FlameJump=1
		#print("doublejump")
	if DestructiveA==1 && Input.is_action_just_pressed("flame_power"):
		Destructive=1
		#flame_state.destructive = true
		#print(flame_state.destructive)
		print("Acid")
		print(Destructive)
	if WaterproofA==1 && Input.is_action_just_pressed("flame_power"):
		Waterproof=1
		print("Dry")
	if ColdA==1 && Input.is_action_just_pressed("flame_power"):
		Cold=1
		print("Icy")
	#print(FlameJump)
	#print(Waterproof)


func _on_area_2d_body_entered(body):
	#print(body.name)
	if body.name=="Darkness" || body.name=="InkCore" || body.name=="Branch":
		#print("hit")
		position.x=Chex
		position.y=Chey
	



func _on_area_2d_area_entered(area):
	#print(area.name)
	if area.name=="FP1":
		FlameJumpA=1
		#print(FlameJumpA)
	if area.name=="FP2":
		DestructiveA=1
	if area.name=="FP3":
		WaterproofA=1
	if area.name=="FP4":
		ColdA=1
	if area.name=="WaterArea" && Waterproof==0:
		position.x=Chex
		position.y=Chey

func _on_flame_area_area_exited(area):
	if area.name=="FP1":
		FlameJumpA=0
	if area.name=="FP2":
		DestructiveA=0
	if area.name=="FP3":
		WaterproofA=0
	if area.name=="FP4":
		ColdA=0
