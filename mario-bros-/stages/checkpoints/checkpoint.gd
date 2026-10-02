extends Area2D

var activated := false

func _on_body_entered(body):
	if activated:
		return

	if body.has_method("set_checkpoint"):
		body.set_checkpoint(global_position)
		activated = true

		print("Checkpoint set at: ", global_position)
