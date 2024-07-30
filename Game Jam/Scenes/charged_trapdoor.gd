extends StaticBody2D

var Detected=0
var Opened=0

func _physics_process(delta):
	if Detected==1 && Blob.Charge==1 && Opened==0:
		get_node("Trapdoor").rotate(.0262)
		await get_tree().create_timer(1.0).timeout
		Blob.Charge=0
		Opened=1

func _on_sensor_area_entered(area):
	if area.name=="BlobArea":
		Detected=1

func _on_sensor_area_exited(area):
	if area.name=="BlobArea":
		Detected=0
