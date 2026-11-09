extends Node


# Called when the node enters the scene tree for the first time.
func hit_stop_short():
	Engine.time_scale = 0.0
	await get_tree().create_timer(0.12, true, false, true).timeout
	Engine.time_scale = 1
