extends Area2D

signal hurt

export (NodePath) var health_path = "../Health"
export (String) var team = "player"
onready var health = get_node(health_path)

func hurt(damage):
	health.get_damage(damage)
	emit_signal("hurt")

func _on_area_entered(area):
	if not area.is_in_group(team):
		hurt(area.damage)

