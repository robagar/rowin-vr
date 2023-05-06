extends Node3D

var interface: XRInterface

var boat


func _ready():
	print("[Main] READY")
	interface = XRServer.find_interface("OpenXR")
	if interface and interface.is_initialized():
		print("[Main] OpenXR INITIALIZED")
		get_viewport().use_xr = true
	else:
		print("[Main] OpenXR NOT INITIALIZED")
		
	boat = $Course/Follow/Boat
		
	var right_hand = $"Course/Follow/Boat/XROrigin3D/RightHand"
	right_hand.connect("button_pressed", right_hand_button_pressed)
	
	
func right_hand_button_pressed(button_name):
	print("[Main] RH BUTTON PRESSED ", button_name)
	if button_name == "ax_button":
		reset_view()
		boat.reset()
		
func reset_view():
	print("[Main] RESET VIEW")
	XRServer.center_on_hmd(XRServer.RESET_BUT_KEEP_TILT, true)
