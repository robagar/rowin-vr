extends Node3D

func _ready():
	var tile_template = $Tile;
	const N = 5
	for i in range(-N, N):
		for j in range(-N, N):
			if i != 0 or j != 0:
				var tile = tile_template.duplicate()
				tile.position.x = i * 10
				tile.position.z = j * 10
				add_child(tile)
				
		
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
