extends Sprite2D

func _ready() -> void:
	# Use a tween to fade out
	var tween = get_tree().create_tween()
	# Fade alpha to 0 over 0.4 seconds
	tween.tween_property(self, "self_modulate:a", 0.0, 0.4)
	# Kill the ghost only AFTER the tween is totally done
	tween.finished.connect(queue_free)
