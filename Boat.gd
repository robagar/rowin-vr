extends Node3D


var started = false
var speed = 0
var headset
var lastHeadsetZ
#var dash
#var courseFollow

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Boat READY")
	headset = $Player/XROrigin3D/XRCamera3D
#	
	#lastHeadsetZ = headset.translation.z
	
	#courseFollow = get_parent()

func _process(delta):
	if !started:
		return
		
	var headsetZ = headset.translation.z
	
	var deltaHeadsetZ = headsetZ - lastHeadsetZ
	
	var acceleration
	if deltaHeadsetZ > 0.001:
		acceleration = 200 * deltaHeadsetZ
	else:
		acceleration = min(-0.5 * speed , -0.1)
	
	speed += delta * acceleration
	speed = clamp(speed, 0, 10)

	#courseFollow.offset += delta * speed
	position.z += delta * speed

	lastHeadsetZ = headsetZ
	

func _unhandled_input(event):
	if event is InputEventJoypadButton:
		print_debug('pressed joypad button %d' % event.button_index)
		
#		if event.button_index == JOY_OCULUS_AX:
		reset()
		
func reset():
	print('RESET')
	XRServer.center_on_hmd(XRServer.RESET_BUT_KEEP_TILT, true)
#	courseFollow.offset = 0
	speed = 0
	started = true

