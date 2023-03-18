extends Node3D

var interface: XRInterface

func _ready():
	interface = XRServer.find_interface("OpenXR")
	if interface and interface.is_initialized():
		print("OpenXR INITIALIZED")
		get_viewport().use_xr = true
	else:
		print("OpenXR NOT INITIALIZED")
	

