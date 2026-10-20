extends Control

@onready var title_bg: ColorRect = $title_bg
@onready var titlemusic: AudioStreamPlayer = $title_bg/titlemusic
@onready var mainmusic: AudioStreamPlayer = $mainmenu/mainmusic

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_anything_pressed():
		titlemusic.stop()
		print("switching to main menu")
		title_bg.hide()
		mainmusic.play()


func _on_start_button_down() -> void:
	print("guh havn't done this yet")

func _on_settings_button_down() -> void:
	print("guh havn't done this yet")

func _on_quit_button_down() -> void:
	print("guh havn't done this yet")
