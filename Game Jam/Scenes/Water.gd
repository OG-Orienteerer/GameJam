extends StaticBody2D

#@onready var Blob = load("res://Scenes/Blob.tscn")
var Presence

func _physics_process(delta):
	#pass
	#print(Blob.Freeze)
	if Presence==1 && Blob.Freeze==1:
		get_node("HitBox").set_deferred("disabled", false)

func _on_water_area_area_entered(area):
	pass

func _on_water_area_area_exited(area):
	if area.name=="BlobArea":
		Presence=0

func _on_freeze_aura_area_entered(area):
	if area.name=="BlobArea":
		Presence=1
		print (area.name)
