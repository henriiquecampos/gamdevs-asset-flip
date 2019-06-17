extends Area2D

var health = null

func _on_area_entered(area):
	if area.is_in_group("player"):
		health = area.health
		$CoolDown.start()


func _on_area_exited(area):
	if area.is_in_group("player"):
		$CoolDown.stop()


func _on_CoolDown_timeout():
	health.heal(1)
