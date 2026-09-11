extends Node2D

@export var offset = Vector2(0, -320)  # negative Y moves up
@export var duration = 10.0  # total up-and-down duration

func _ready():
	start_tween()

func start_tween():
	var start_pos = $AnimatableBody2D.position

	var tween = get_tree().create_tween()
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops()  # loops indefinitely

	# Move from start to offset (up)
	tween.tween_property($AnimatableBody2D, "position", start_pos + offset, duration / 2)
	# Then move back to start (down)
	tween.tween_property($AnimatableBody2D, "position", start_pos, duration / 2)
