extends Node3D

#var camera: XRCamera3D
var head: XRNode3D

func _ready():
	print("[Boat] READY")
	#camera = $XROrigin3D/XRCamera3D
	#print("[Boat] camera ", camera)
	head = $XROrigin3D/Head


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print("[Boat] process ", delta)
	#var camera_z = camera.translation.z
	#print("[Boat] camera z ", camera_z)
	var pose = head.get_pose()
	print("[Boat] head pose origin ", pose.transform.origin)
