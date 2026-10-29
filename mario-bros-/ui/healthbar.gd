extends Control

@onready var bar: TextureRect = $Head/bar

const MAX_HP = 8
@export var DisplayHP: int = 8:
	set(i):
		if !is_node_ready(): await ready
		DisplayHP = i
		var hp = bar.texture as AtlasTexture
		hp.region.position.y = (MAX_HP - i) * hp.region.size.y
