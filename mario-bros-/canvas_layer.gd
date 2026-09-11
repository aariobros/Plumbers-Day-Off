extends CanvasLayer

@onready var counter = $VBoxContainer/Counter

func _ready():
	counter.text = "Deaths: " + str(GameManager.death_count)

	await get_tree().create_timer(1.5).timeout

	_respawn()
	
func _respawn():
	get_tree().change_scene_to_file(GameManager.level_scene_path)
