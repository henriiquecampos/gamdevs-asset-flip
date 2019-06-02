extends Node

export (NodePath) var actor_path = ".."
onready var actor = get_node(actor_path)

func _ready():
	set_physics_process(false)