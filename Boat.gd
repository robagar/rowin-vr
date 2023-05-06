extends Node3D

var head: XRNode3D

var lastHeadZ
var acceleration = 0
var speed = 0

var courseFollow

const ROWING_FORCE = 200
const DRAG = -0.5
const MAX_SPEED = 10

func _ready():
	print("[Boat] READY")
	head = $XROrigin3D/Head
	courseFollow = get_parent()


func _process(delta):
	var pose = head.get_pose()
	if pose:
#		print("[Boat] head pose origin ", pose.transform.origin)
		var headZ = pose.transform.origin.z
		
		if lastHeadZ != null:
			var deltaHeadZ = headZ - lastHeadZ
			
			if deltaHeadZ > 0.001:
				acceleration = deltaHeadZ * ROWING_FORCE
			else:
				acceleration = speed * DRAG
				
			speed += delta * acceleration	
			speed = clamp(speed, 0, MAX_SPEED)		
			
			# translate(Vector3(0, 0, speed * delta))
			
			courseFollow.progress += speed * delta

		lastHeadZ = headZ
			
func reset():
	print("[Boat] RESET")
	speed = 0
	acceleration = 0
	#position = Vector3(0,0,0)
	courseFollow.progress = 0
	
	
