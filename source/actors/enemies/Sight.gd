extends Area2D

signal spotted(spottable_area)
signal missed(spottable_area)

export (String) var team = "enemy"

func _on_area_entered(area):
	if not area.is_in_group(team):
		emit_signal("spotted", area)


func _on_area_exited(area):
	if not area.is_in_group(team):
		emit_signal("missed", area)
