extends Timer

export (float) var min_wait_time = 0.5
export (float) var max_wait_time = 5.0

func _ready():
	randomize()
	randomize_wait_time()


func _on_timeout():
	randomize_wait_time()


func randomize_wait_time():
	wait_time = rand_range(min_wait_time, max_wait_time)
