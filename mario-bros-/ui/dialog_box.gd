extends Control

@export_multiline() var Text = "Put your dialog here for testing"
@onready var icon: TextureRect = $margins/panel/container/icon
@onready var charactername: Label = $margins/panel/container/margins/container/charactername
@onready var text: RichTextLabel = $margins/panel/container/margins/container/text

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventAction:
		match event.action:
			&"run":
				print("continue dialog")
