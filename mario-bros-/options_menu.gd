extends Control

# --- Node references ---
@onready var back_button = $VBoxContainer/Back
@onready var volume_slider = $VBoxContainer/Volume
@onready var fullscreen_checkbox = $VBoxContainer/Fullscreen

# --- Config file path ---
const CONFIG_PATH := "user://settings.cfg"

func _ready():
	# Ensure nodes exist
	if not back_button or not volume_slider or not fullscreen_checkbox:
		push_error("One or more nodes not found in Options menu!")
		return

	# Connect signals
	back_button.pressed.connect(Callable(self, "_on_back_pressed"))
	volume_slider.value_changed.connect(Callable(self, "_on_volume_changed"))
	fullscreen_checkbox.toggled.connect(Callable(self, "_on_fullscreen_toggled"))

	# Load saved settings
	var cfg = ConfigFile.new()
	var err = cfg.load(CONFIG_PATH)
	if err == OK:
		volume_slider.value = cfg.get_value("audio", "volume_db", -10)
		fullscreen_checkbox.button_pressed = cfg.get_value("display", "fullscreen", false)
	else:
		# Defaults
		volume_slider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
		fullscreen_checkbox.button_pressed = false

	# Apply initial settings
	_on_volume_changed(volume_slider.value)
	_on_fullscreen_toggled(fullscreen_checkbox.button_pressed)

# --- Back button ---
func _on_back_pressed():
	get_tree().change_scene_to_file("res://Title.tscn")

# --- Volume update ---
func _on_volume_changed(value: float) -> void:
	# Apply volume
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)

	# Save to config
	var cfg = ConfigFile.new()
	cfg.load(CONFIG_PATH)
	cfg.set_value("audio", "volume_db", value)
	cfg.save(CONFIG_PATH)

# --- Fullscreen toggle ---
func _on_fullscreen_toggled(pressed: bool) -> void:
	if pressed:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

	# Save to config
	var cfg = ConfigFile.new()
	cfg.load(CONFIG_PATH)
	cfg.set_value("display", "fullscreen", pressed)
	cfg.save(CONFIG_PATH)
