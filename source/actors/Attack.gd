extends "res://actors/BeatEmUpAction.gd"

var direction = -1 setget set_direction

func set_direction(new_direction):
	assert(direction == 1 or direction == -1)
	direction = new_direction


func execute():
	if direction == 1:
		$Area2D/Right.disabled = false
	else:
		$Area2D/Left.disabled = false


func stop():
	if direction == 1:
		$Area2D/Right.disabled = true
	else:
		$Area2D/Left.disabled = true