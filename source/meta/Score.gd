extends Node

signal score_changed(score)
var current = 0 setget set_current

func set_current(value):
	current = value
	emit_signal("score_changed", current)
