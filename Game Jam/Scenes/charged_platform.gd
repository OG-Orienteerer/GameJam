extends CharacterBody2D

var Detected=0
var Opened=0
@export var speed=300
var zoom = 0
var direction=-1
var Bonk=0

func _physics_process(delta):
	if Detected==1 && Blob.Charge==1 && Opened==0:
		velocity.x=speed*direction
		#print(zoom)
	
	#if Detected==0:
	#	velocity.x=0
	#	await get_tree().create_timer(1.0).timeout
	#	direction=-direction
		
	
	if Bonk==1:
		
		direction=-direction
		await get_tree().create_timer(1.0).timeout
	
	velocity.y=0
	
	#print(Bonk)
	#print(direction)
	#print(velocity.x)
	
	#if velocity.x==0:
	#	direction=-direction
	
	move_and_slide()

func _on_sensor_area_entered(area):
	if area.name=="BlobArea":
		Detected=1

func _on_sensor_area_exited(area):
	if area.name=="BlobArea":
		Detected=0

func _on_sensor_body_entered(body):
	#print(body)
	
	if body is StaticBody2D:
		Bonk=1
		#await get_tree().create_timer(1.0).timeout
		print("Ping")

func _on_sensor_body_exited(body):
	#print(body)
	
	if body is StaticBody2D:
		#await get_tree().create_timer(1.0).timeout
		Bonk=0
		print("pong")
#
