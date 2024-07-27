extends Node2D

@export var level_path: String

func _on_button_pressed() -> void:
	GameManager.change_scene(level_path)
