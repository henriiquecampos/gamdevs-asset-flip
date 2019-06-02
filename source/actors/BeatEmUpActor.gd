extends KinematicBody2D

var velocity = Vector2.ZERO

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		handle_collision(collision)


func handle_collision(collision):
	pass

