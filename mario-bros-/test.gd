extends Node2D

@onready var player = $player
@export var current_theme : AudioStream

func _ready():
	if GameManager.respawn_position != Vector2.ZERO:
		player.global_position = GameManager.respawn_position
