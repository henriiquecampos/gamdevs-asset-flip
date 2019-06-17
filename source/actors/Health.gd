extends Node

signal depleated
signal replenished
signal damaged(amount)
signal amount_changed(amount)

export (int) var max_health = 5

onready var _amount = max_health setget _set_amount

func get_damage(damage):
	_amount -= damage
	_amount = clamp(_amount, 0, max_health)
	_set_amount(_amount)
	emit_signal("damaged", damage)
	if _amount < 1:
		deplete()


func deplete():
	_amount = max(0, _amount)
	_set_amount(_amount)
	emit_signal("depleated")


func replenish():
	_amount = max_health
	emit_signal("replenished")

func _set_amount(value):
	_amount = value
	emit_signal("amount_changed", _amount)


func heal(amount):
	_amount += amount
	_amount = min(_amount, max_health)
	_set_amount(_amount)
