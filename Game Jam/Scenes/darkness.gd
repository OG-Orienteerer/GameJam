extends CharacterBody2D

class_name Enemy1

@export var speed = 100
@export var gravity = 100
var direction = -1
var inside_area = false
var contact=0
var nudged=0

func _physics_process(delta):
	
	if is_on_floor():
		var direction=1
	
	if velocity.x==0:
		direction=-direction
	
	if !is_on_floor() || inside_area == true:
		velocity.y +=gravity + contact
		if velocity.y>500:
			velocity.y = 500
	
	if !nudged==1 :
		velocity.x=speed * direction
	
	move_and_slide()
	
func _on_area_2d_area_entered(area):
	inside_area = true
	#hide()
	if nudged==0 && (area.name=="FlameArea" || area.name=="BlobArea" || area.name=="InkCore"):
		velocity.y-=1500
		velocity.x=direction*300
		get_node("Hitbox").set_deferred("disabled", true)
		nudged=1
	
