extends Node

var pop_label_scene = preload("res://interface/PopLabel.tscn")

func create_pop_label(text, position):
	var pop_label = pop_label_scene.instance()
	pop_label.set_text(text)
	pop_label.global_position = position
	$PopLabels.add_child(pop_label)
