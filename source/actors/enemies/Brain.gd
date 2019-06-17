extends Node

signal turn_left
signal turn_right

onready var body = get_node(body_path)
export (NodePath) var body_path = ".."

onready var sprite = get_node(sprite_path)
export (NodePath) var sprite_path = "../Sprite"

onready var walk = get_node(walk_path)
export (NodePath) var walk_path = "../Walk"

onready var attack = get_node(attack_path)
export (NodePath) var attack_path = "../Attack"

onready var animator = get_node(animator_path)
export (NodePath) var animator_path = "../AnimationPlayer"

export (String) var attack_animation = "AttackHammer"

export (float) var attack_range = 16

var _target = null
var _look_direction = Vector2.LEFT

func _ready():
	set_physics_process(false)

func _on_Sight_spotted(spottable_area):
	_target = spottable_area.spottable_body
	if not _target.is_connected("tree_exiting", self, "_on_Target_tree_exiting"):
		_target.connect("tree_exiting", self, "_on_Target_tree_exiting")
	set_physics_process(true)


func _on_Target_tree_exiting():
	set_physics_process(false)
	attack.get_node("CoolDown").stop()


func _on_Sight_missed(spottable_area):
	walk.stop()
	set_physics_process(false)


func _physics_process(delta):
	move()
	check_for_attack()
	turn()


func move():
	_look_direction = (_target.global_position - body.global_position).normalized()
	walk.set_horizontal_direction(_look_direction.x)
	walk.set_vertical_direction(_look_direction.y)


func check_for_attack():
	if body.global_position.distance_to(_target.global_position) <= attack_range:
		walk.stop()
		attack()


func turn():
	var horizontal_direction = -1 if _look_direction.x <= 0 else 1
	if horizontal_direction < 0:
		emit_signal("turn_left")
	else:
		emit_signal("turn_right")


func attack():
	set_physics_process(false)
	var attack_direction = -1 if _look_direction.x <= 0 else 1
	attack.set_direction(attack_direction)
	animator.play(attack_animation)
	var cooldown = attack.get_node("CoolDown")
	cooldown.start()
	yield(cooldown, "timeout")
	set_physics_process(true)
