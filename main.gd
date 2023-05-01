extends Node3D

var interface: XRInterface

func _ready():
	print("Main READY")
	interface = XRServer.find_interface("OpenXR")
	if interface and interface.is_initialized():
		print("OpenXR INITIALIZED")
		get_viewport().use_xr = true
	else:
		print("OpenXR NOT INITIALIZED")
		
	var right_hand = $"Boat/XROrigin3D/RightHand"
	right_hand.connect("button_pressed", right_hand_button_pressed)
	
func right_hand_button_pressed(button_name):
	print("RH BUTTON PRESSED ", button_name)
	if button_name == "ax_button":
		reset_view()
		
func reset_view():
	print("RESET VIEW")
	XRServer.center_on_hmd(XRServer.RESET_BUT_KEEP_TILT, true)
