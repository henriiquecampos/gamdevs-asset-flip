extends Position2D

export (PackedScene) var spawnling = preload("res://actors/enemies/Orc.tscn")
export (NodePath) var spawn_container = ".."

func spawn():
	var instance = spawnling.instance()
	instance.global_position = global_position
	get_node(spawn_container).add_child(instance)
