extends Control




@onready var start_button = $VBoxContainer/Start
@onready var options_button = $VBoxContainer/Options
@onready var quit_button = $VBoxContainer/Quit

func _ready():
	start_button.pressed.connect(_on_start_pressed)
	options_button.pressed.connect(_on_options_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

func _on_start_pressed():
	print("Start pressed")
	get_tree().change_scene_to_file("res://test.tscn")

func _on_options_pressed():
	print("Options pressed")
	get_tree().change_scene_to_file("res://options_menu.tscn")

func _on_quit_pressed():
	get_tree().quit()
