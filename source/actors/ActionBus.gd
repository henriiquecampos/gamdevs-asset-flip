extends Node

signal up_pressed
signal up_released
signal left_pressed
signal left_released
signal right_pressed
signal right_released
signal down_pressed
signal down_released
signal attack_pressed
signal attack_released
signal defend_pressed
signal defend_released
signal jump_pressed
signal jump_released
signal dash_pressed
signal dash_released

export (String) var up
export (String) var left
export (String) var down
export (String) var right
export (String) var attack
export (String) var defend
export (String) var jump
export (String) var dash

func _unhandled_input(event):
	if not event.is_action_type():
		return
	
	if event.is_action(up) or event.is_action(down):
		handle_vertical_action(event)
	if event.is_action(left) or event.is_action(right):
		handle_horizontal_action(event)
	if event.is_action(attack):
		handle_attack_action(event)
	if event.is_action(defend):
		handle_defend_action(event)
	if event.is_action(jump):
		handle_jump_action(event)
	if event.is_action(dash):
		handle_dash_action(event)


func handle_vertical_action(event):
	if event.is_action_pressed(up):
		emit_signal("up_pressed")
	elif event.is_action_released(up):
		if not Input.is_action_pressed(down):
			emit_signal("up_released")
		else:
			emit_signal("down_pressed")
	if event.is_action_pressed(down):
		emit_signal("down_pressed")
	elif event.is_action_released(down):
		if not Input.is_action_pressed(up):
			emit_signal("down_released")
		else:
			emit_signal("up_pressed")

func handle_horizontal_action(event):
	if event.is_action_pressed(left):
		emit_signal("left_pressed")
	elif event.is_action_released(left):
		if not Input.is_action_pressed(right):
			emit_signal("left_released")
		else:
			emit_signal("right_pressed")
	if event.is_action_pressed(right):
		emit_signal("right_pressed")
	elif event.is_action_released(right):
		if not Input.is_action_pressed(left):
			emit_signal("right_released")
		else:
			emit_signal("left_pressed")


func handle_jump_action(event):
	pass


func handle_dash_action(event):
	pass


func handle_attack_action(event):
	if event.is_action_pressed(attack):
		emit_signal("attack_pressed")
	elif event.is_action_released(attack):
		emit_signal("attack_released")


func handle_defend_action(event):
	pass

