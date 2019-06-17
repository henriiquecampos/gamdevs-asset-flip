extends "res://actors/BeatEmUpAction.gd"

export (float) var speed = 50.0
var horizontal_direction = 0.0 setget set_horizontal_direction
var vertical_direction = 0.0 setget set_vertical_direction

func _physics_process(delta):
	actor.velocity.x = speed * horizontal_direction
	actor.velocity.y = speed * vertical_direction


func set_horizontal_direction(new_horizontal_direction):
	horizontal_direction = new_horizontal_direction
	set_physics_process(true)


func set_vertical_direction(new_vertical_direction):
	vertical_direction = new_vertical_direction
	set_physics_process(true)


func stop():
	vertical_direction = 0.0
	horizontal_direction = 0.0
	actor.velocity = Vector2.ZERO
	set_physics_process(false)
