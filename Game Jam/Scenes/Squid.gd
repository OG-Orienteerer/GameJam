extends CharacterBody2D

#class_name Enemy
@export var speed: int=1
@export var projectile: PackedScene
@onready var spawn_point: Marker2D=$Marker2D
var time = 0
@export var interval=2
var can_shoot = 1

const Move_Speed: float = 500

func _physics_process(delta):	
	#can_shoot=0
	#wait()
	#can_shoot=1
	#look_at(get_global_mouse_position())
	#if Input.is_action_just_pressed("shoot"): shoot()
	time+=delta
	if time>=interval && can_shoot==1:
		shoot()
		#print("shot")
		time=0

func shoot():
	var inst = projectile.instantiate()
	owner.add_child(inst)
	inst.transform = spawn_point.global_transform
	

func wait():
	await get_tree().create_timer(1.0).timeout
	

func _on_area_2d_area_entered(area):
	hide()
	can_shoot=0
	#get_node("InkHitBox").set_deferred("disabled", true)
