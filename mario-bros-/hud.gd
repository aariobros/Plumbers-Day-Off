extends CanvasLayer

@export var player_node: NodePath
@onready var health_sprite: AnimatedSprite2D = $AnimatedSprite2D

var player

func _ready():
	if player_node != NodePath():
		player = get_node(player_node)
		
		# Set the animation to "healthbar" and stop it from playing automatically
		health_sprite.animation = "healthbar"
		health_sprite.stop()  # Godot 4: use stop() instead of 'playing = false'
		
		# Connect the player's health signal first
		if player.has_signal("health_changed"):
			player.connect("health_changed", Callable(self, "_update_health"))
		
		# Initialize health bar immediately so 0 health shows correctly
		_update_health(player.current_health)

func _update_health(current_health: int) -> void:
	# Clamp health to 0–8 to avoid errors
	current_health = clamp(current_health, 0, 8)
	
	# Map health 0–8 → frame 1–9
	health_sprite.frame = current_health 
	
	# Optional: low-health flash like SM64
	if current_health <= 2:
		health_sprite.modulate = Color(1, 0.5, 0.5)  # red tint
	else:
		health_sprite.modulate = Color(1, 1, 1)
