extends Area2D

var Presence = 0

func _physics_process(delta):
	if Presence==1 && Input.is_action_just_pressed("blob_power"):
		hide()
		#print("claimed")

func _on_area_entered(area):
	if area.name=="BlobArea":
		Presence=1
		#print("Present")
	#print(area.name)

func _on_area_exited(area):
	if area.name=="BlobArea":
		Presence=0
	#print("gone")
