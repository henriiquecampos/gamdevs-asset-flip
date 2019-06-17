extends "res://actors/BeatEmUpAction.gd"

signal executed
onready var hitbox = $HitBox
var direction = 1 setget set_direction


func set_direction(new_direction):
	assert(direction == 1 or direction == -1)
	direction = new_direction


func execute():
	if direction == 1:
		hitbox.get_node("Right").disabled = false
	else:
		hitbox.get_node("Left").disabled = false
	emit_signal("executed")


func stop():
	if direction == 1:
		hitbox.get_node("Right").disabled = true
	else:
		hitbox.get_node("Left").disabled = true
