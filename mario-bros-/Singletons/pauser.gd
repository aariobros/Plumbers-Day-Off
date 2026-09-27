extends Node

const PAUSE_IMAGE = preload("uid://dp7mokxo277ee") 

var pause_layer: CanvasLayer = null
var pause_sprite: Sprite2D = null

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	# 1. Create the CanvasLayer to put it on top of everything
	pause_layer = CanvasLayer.new()
	pause_layer.layer = 100 # High number ensures it sits above other UI
	add_child(pause_layer)
	
	# 2. Create the sprite
	pause_sprite = Sprite2D.new()
	pause_sprite.texture = PAUSE_IMAGE
	pause_sprite.scale /= 2
	pause_sprite.visible = false
	pause_layer.add_child(pause_sprite)
	
	# 3. Center it immediately and listen for window resizing
	
	
	# Center it on the screen (assuming standard project settings)
	var screen_center = get_viewport().get_visible_rect().size / 2
	pause_sprite.position = screen_center
	
	# Add it to the scene tree
	add_child(pause_sprite)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = not get_tree().paused
	if get_tree().paused == true:
		show_pause_sprite()
	else:
		hide_pause_sprite()

func show_pause_sprite() -> void:
	pause_sprite.visible = true
	# Create the sprite dynamically
	

func hide_pause_sprite() -> void:
		# Using free() instead of queue_free() deletes it instantly this frame
	pause_sprite.visible = false
	
