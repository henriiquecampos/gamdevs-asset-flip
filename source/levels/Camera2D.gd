extends Camera2D

onready var duration = $Duration
export (float) var shake_strength = 1


func _ready():
	set_process(false)

func _process(delta):
	offset.x = rand_range(-shake_strength, shake_strength)
	offset.y = rand_range(-shake_strength, shake_strength)

func shake(strength = shake_strength, time = duration.wait_time):
	
	var default_time = duration.wait_time
	var default_strength = shake_strength

	shake_strength = strength
	duration.wait_time = time

	set_process(true)
	duration.start()
	yield(duration, "timeout")

	set_process(false)
	offset = Vector2(0, 0)
	shake_strength = default_strength
	duration.wait_time = default_time
