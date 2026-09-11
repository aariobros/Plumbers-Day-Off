extends Sprite2D

func _ready() -> void:
	# Create a simple fade-out effect
	var tween = create_tween()
	tween.tween_property(self, "self_modulate:a", 0.0, 0.35).set_trans(Tween.TRANS_SINE)
	tween.finished.connect(queue_free)
