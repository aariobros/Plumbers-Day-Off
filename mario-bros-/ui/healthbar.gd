extends Control

@onready var bar: Sprite2D = $Head/bar

const MAX_HP = 8
@export var DisplayHP: int = 9:
	set(i): 
		if bar:
			bar.frame = MAX_HP - i
		DisplayHP = i
