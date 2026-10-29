extends Area2D

@export var dialog: Control

func _process(delta: float) -> void:
	if has_overlapping_bodies() and Input.is_action_just_pressed("up"):
		dialog.show()
		dialog.call_deferred("grab_focus", true)
