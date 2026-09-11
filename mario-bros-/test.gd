extends Node2D

@onready var player = $player

func _ready():
	if GameManager.respawn_position != Vector2.ZERO:
		player.global_position = GameManager.respawn_position
